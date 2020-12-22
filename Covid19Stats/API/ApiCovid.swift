//
//  CovidFetchRequest.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 17/12/20.
//

import Foundation
import NBApollo
import Alamofire

class ApiCovid: ObservableObject {
    
    @Published var countries: [Country] = []
    @Published var worldSummary: WorldSummary = WorldSummary.dummyWorldSummaryData

    fileprivate let worldRequest: ApiRestClient<WorldSummary> = {
        do {
            let config = ApiCovidConfigurator()
            let frm = FileReadManager(withConfig: config)
            let dictionary = try frm.getApiDictionary(with: config.covid)
            guard let baseUrl = dictionary[config.baseUrl] as? String, let endpoint = dictionary[config.totals] as? String else {
                return ApiRestClient<WorldSummary>(urlServer: "")
            }
            return ApiRestClient<WorldSummary>(urlServer: "\(baseUrl)\(endpoint)")
        } catch {
            return ApiRestClient<WorldSummary>(urlServer: "")
        }
    }()
    
    fileprivate let countriesRequest: ApiRestClient<[Country]> = {
        do {
            let config = ApiCovidConfigurator()
            let frm = FileReadManager(withConfig: config)
            let dictionary = try frm.getApiDictionary(with: config.covid)
            guard let baseUrl = dictionary[config.baseUrl] as? String, let endpoint = dictionary[config.countries] as? String else {
                return ApiRestClient<[Country]>(urlServer: "")
            }
            return ApiRestClient<[Country]>(urlServer: "\(baseUrl)\(endpoint)")
        } catch {
            return ApiRestClient<[Country]>(urlServer: "")
        }
    }()
    
    init() {
        getCurrentTotal()
        getAllCountries()
    }
    
    func getCurrentTotal() {
        worldRequest.request(method: .get, parameters: nil) { (result) in
            switch result {
            case .failure(let error):
                debugPrint(error.reason)
            case .success(let response):
                self.worldSummary = response
            }
        }
    }
    
    func getAllCountries() {
        let parameters = ["yesterday": "1", "allowNull" : "1", "sort" : "todayCases" ]
        countriesRequest.request(method: .get, parameters: parameters) { (result) in
            switch result {
            case .failure(let error):
                debugPrint(error.reason)
            case .success(let countries):
                self.countries = countries //self.countries = countries.sorted(by: {$0.confirmed > $1.confirmed})
            }
        }
    }
}
