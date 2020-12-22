//
//  ApiCovidConfigurator.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 17/12/20.
//

import Foundation
import NBApollo

class ApiCovidConfigurator: ApiRawValueProtocol {
    
    var apiConfiguration: String = "ApiCovid"
    var plist: String = "plist"
    let covid = "covid"
    let baseUrl = "baseUrl"
    let totals = "totals"
    let countries = "countries"
    
}
