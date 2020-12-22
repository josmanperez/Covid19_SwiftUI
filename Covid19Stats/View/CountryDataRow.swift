//
//  CountryDataRow.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 17/12/20.
//

import SwiftUI

struct CountryDataRow: View {
    
    var countryData: Country
    
    var body: some View {
        HStack {
            Text(countryData.country)
                .fontWeight(.medium)
                .font(.subheadline)
                .lineLimit(2)
                .frame(width: 110, alignment: .leading)
            
            Spacer()
            
            Text(countryData.todayCases?.formatNumber() ?? "0")
                .font(.subheadline)
                .frame(width: 70, height: 40)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryData.todayDeaths?.formatNumber() ?? "0")
                .font(.subheadline)
                .frame(width: 50, height: 40, alignment: .center)
                .padding(.leading, 5)
                .foregroundColor(.red)
            Spacer()
            
            Text(countryData.todayRecovered?.formatNumber() ?? "0")
                .font(.subheadline)
                .frame(width: 80, height: 40, alignment: .center)
                .padding(.leading, 5)
                .foregroundColor(.green)
        }
    }
}

struct CountryDataRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataRow(countryData: Country.dummyCountryData)
            .previewDevice("iPhone SE (2nd generation)")
    }
}
