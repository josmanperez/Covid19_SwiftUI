//
//  TotalDataView.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 18/12/20.
//

import SwiftUI

struct TotalDataView: View {
    
    var totalData: WorldSummary
    var body: some View {
        
        VStack {
            HStack {
                TotalDataCard(number: totalData.todayCases?.formatNumber() ?? "N/A", name: "Confirmed")
                TotalDataCard(number: totalData.critical?.formatNumber() ?? "N/A", name: "Critical", color: .yellow)
                TotalDataCard(number: totalData.deaths?.formatNumber() ?? "N/A", name: "Deaths", color: .red)
            } // End of HStack
            HStack {
                TotalDataCard(number: totalData.fatalityRate, name: "Death %", color: .red)
                TotalDataCard(number: totalData.critical?.formatNumber() ?? "N/A", name: "Recover", color: .green)
                TotalDataCard(number: totalData.recoveredRate, name: "Recovery %", color: .green)
            } // End of HStack
        } // End of VStack
        .frame(height: 170)
        .padding(10)
    }
}

struct TotalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataView(totalData: WorldSummary.dummyWorldSummaryData)
    }
}
