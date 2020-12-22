//
//  Country.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 17/12/20.
//

import Foundation

class Country: WorldSummary {
    
    enum CountryKeys: String, CodingKey {
        case country
        case casesPerOneMillion
        case deathsPerOneMillion
        case recoveredPerOneMillion
        case population
        case countryInfo
    }
    
    var country: String
    var population: Int
    var casesPerOneMillion: Float?
    var deathsPerOneMillion: Float?
    var recoveredPerOneMillion: Float?
    var countryInfo: CountryInfo
    
    static var dummyCountryData: Country {
        get {
            let c = Country(country: "Country with large name")
            return c
        }
    }
    
    fileprivate init(country: String) {
        self.country = country
        self.population = 1000
        self.casesPerOneMillion = 1000
        self.deathsPerOneMillion = 1000
        self.recoveredPerOneMillion = 1000
        self.countryInfo = CountryInfo.dummyData
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CountryKeys.self)
        self.country = try container.decode(String.self, forKey: .country)
        if let _population = try container.decodeIfPresent(Int.self, forKey: .population) {
            self.population = _population
        } else {
            self.population = 0
        }
        self.casesPerOneMillion = try container.decodeIfPresent(Float.self, forKey: .casesPerOneMillion)
        self.deathsPerOneMillion = try container.decodeIfPresent(Float.self, forKey: .deathsPerOneMillion)
        self.recoveredPerOneMillion = try container.decodeIfPresent(Float.self, forKey: .recoveredPerOneMillion)
        self.countryInfo = try container.decode(CountryInfo.self, forKey: .countryInfo)
        try super.init(from: decoder)
    }
}

class CountryInfo: Decodable {
    
    static let dummyData: CountryInfo = {
        let ci = CountryInfo()
        return ci
    }()
    
    private init() {
        self._id = 1
        self.iso2 = "iso"
        self.iso3 = "iso3"
        self.lat = 12
        self.long = -12
        self.flag = "flag"
    }
    
    enum CountryInfoKeys: String, CodingKey {
        case _id
        case iso2, iso3
        case lat, long
        case flag
    }
    
    var _id: Int?
    var iso2: String?
    var iso3: String?
    var lat: Double?
    var long: Double?
    var flag: String
    
    /*required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CountryInfoKeys.self)
//        if let id = try container.decodeIfPresent(Int.self, forKey: ._id) {
//            self._id = id
//            self.lat = try container.decode(Double.self, forKey: .lat)
//            self.long = try container.decode(Double.self, forKey: .long)
//        } else {
//            self._id = nil
//            self.lat = nil
//            self.long = nil
//        }
        
    }*/
    
}
