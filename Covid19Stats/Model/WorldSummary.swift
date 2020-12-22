//
//  WorldSummary.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 17/12/20.
//

import Foundation

class WorldSummary: Decodable {
    
    enum WorldSummaryKeys: String, CodingKey {
        case cases
        case todayCases
        case active
        case critical
        case deaths
        case todayDeaths
        case updated
        case recovered
        case todayRecovered
    }
    
    var cases: Int?
    var todayCases: Int?
    var active: Int?
    var critical: Int?
    var deaths: Int?
    var todayDeaths: Int?
    var updated: Int?
    var recovered: Int?
    var todayRecovered: Int?
    
    /// Variable to help drawing canvas
    /// - Returns: a dummy `WorldSummary` object
    static var dummyWorldSummaryData: WorldSummary {
        get {
            return WorldSummary()
        }
    }
    
    /// Initializer to use with SwiftUI
    init() {
        self.cases = 100
        self.todayCases = 231269
        self.critical = 90
        self.deaths = 80
        self.todayDeaths = 3278
        self.recovered = 90
        self.todayRecovered = 120338
        self.updated = 1100
        self.active = 90
        
    }
    
    var fatalityRate: String {
        guard let _deaths = deaths, let _cases = cases else { return "N/A" }
        return (_deaths == 0 || _cases == 0) ? "N/A" : String(format: "%.2f", (Double(_deaths)/Double(_cases)) * 100)
    }
    
    var recoveredRate: String {
        guard let _recovered = recovered, let _cases = cases else { return "N/A" }
        return (_recovered == 0 || _cases == 0) ? "N/A" : String(format: "%.2f", (Double(_recovered)/Double(_cases)) * 100)
    }
    
    var lastUpdated: String {
        guard let _updated = updated else { return "N/A"}
        let date = Date(timeIntervalSince1970: Double(_updated/1000))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: date)
    }
    
}
