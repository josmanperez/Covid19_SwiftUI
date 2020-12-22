//
//  SearchView.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 18/12/20.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Country...", text: $searchText)
                .padding()
        }
        .frame(height: 50)
        .background(Color("cardBackground"))
    }
}
