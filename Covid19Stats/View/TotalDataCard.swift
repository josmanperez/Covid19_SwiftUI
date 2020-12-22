//
//  TotalDataCard.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 18/12/20.
//

import SwiftUI

struct TotalDataCard: View {
    
    var number: String = "Error"
    var name: String = "Cases"
    var color: Color = .primary
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Text(self.number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
                Text(self.name)
                    .font(.body)
                    .padding(5)
                    .foregroundColor(self.color)
            } // End of VStack
            .frame(width: geometry.size.width, height: 80, alignment: .center)
            .background(Color("cardBackground"))
            .cornerRadius(8.0)
            
        }
    }
}

struct TotalDataCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataCard()
    }
}
