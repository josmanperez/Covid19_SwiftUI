//
//  Base.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 17/12/20.
//

import Foundation

// TODO: Finish this class
class Base: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case confirmed
        case critical
        case deaths
        case lastChange
        case lastUpdate
        case recovered
    }
    
    var confirmed: Int
    var critical: Int
    var deaths: Int
    var lastChange: String
    var lastUpdate: String
    var recovered: Int
    
    var fatalityRate: Double {
        return (Double(deaths)/Double(confirmed)) * 100
    }
    
    var recoveredRate: Double {
        return (Double(recovered)/Double(confirmed)) * 100
    }
    
}
