//
//  CountryDetailView.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 21/12/20.
//

import SwiftUI

struct CountryDetailView: View {
    
    var countryData: Country
    
    var body: some View {
        VStack {
            VStack {
                CountryDetailRow(number: countryData.cases?.formatNumber() ?? "N/A" ,name: "Confirmed").padding(.top)
                CountryDetailRow(number: countryData.critical?.formatNumber() ?? "N/A", name: "Critical", color: .yellow)
                CountryDetailRow(number: countryData.deaths?.formatNumber() ?? "N/A", name: "Deaths", color: .red)
                CountryDetailRow(number: countryData.recovered?.formatNumber() ?? "N/A", name: "Recovered", color: .green)
                CountryDetailRow(number: countryData.population.formatNumber(), name: "Population")
                CountryDetailRow(number: countryData.deathsPerOneMillion?.formatNumber() ?? "N/A", name: "Deaths per one million", color: .red)
                CountryDetailRow(number: countryData.casesPerOneMillion?.formatNumber() ?? "N/A", name: "Cases per one million", color: .yellow)
                CountryDetailRow(number: countryData.fatalityRate, name: "Death%", color: .red)
                CountryDetailRow(number: countryData.recoveredRate, name: "Recovery%", color: .green)
            }
            .background(Color("cardBackground"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        .padding(.top, 20)
        .navigationTitle(countryData.country)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryData: Country.dummyCountryData)
    }
}
