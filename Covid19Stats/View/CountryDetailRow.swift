//
//  CountryDetailRow.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 21/12/20.
//

import SwiftUI

struct CountryDetailRow: View {
    
    var number: String = "Error"
    var name: String = "Cases"
    var color: Color = .primary
    
    var body: some View {
        VStack {
            HStack {
                Text(self.name)
                    .font(.body)
                    .padding(5)
                Spacer()
                Text(self.number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(color)
            }
            Divider()
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct CountryDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailRow()
    }
}
