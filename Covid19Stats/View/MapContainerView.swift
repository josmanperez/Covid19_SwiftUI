//
//  MapContainerView.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 21/12/20.
//

import SwiftUI

struct MapContainerView: View {
    
    @ObservedObject var covidFetch = ApiCovid()
    
    var body: some View {
        
        MapView(countryData: $covidFetch.countries)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
