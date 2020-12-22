//
//  RecentView.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 17/12/20.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var covidFetch = ApiCovid()
    @State var searchText = ""
    @State var isSearchVisible = false
    
    var body: some View {
        NavigationView {
            VStack {
                if isSearchVisible {
                    SearchView(searchText: $searchText)
                }
                TotalDataView(totalData: covidFetch.worldSummary)
                ListHeaderView()
                List {
                    ForEach(covidFetch.countries.filter {
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) {
                        countryData in
                        NavigationLink(
                            destination: CountryDetailView(countryData: countryData)) {
                                CountryDataRow(countryData: countryData)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            } // End of VStack
            .navigationTitle("\(covidFetch.worldSummary.lastUpdated)")
            .navigationBarItems(trailing:
                Button(action: {
                    self.isSearchVisible.toggle()
                    if !self.isSearchVisible {
                        self.searchText = ""
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                })
            )
        } // End of Navigation View
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
