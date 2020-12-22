//
//  ListHeaderView.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 17/12/20.
//

import SwiftUI

struct ListHeaderView: View {
    var body: some View {
        HStack {
            Text("Country")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 110, alignment: .leading)
                .padding(.leading, 15)
            
            Spacer()
            
            Text("Conf.")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 70, height: 40)
                .padding(.leading, 5)
            
            Spacer()
            
            Text("Death")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 50, height: 40)
                .padding(.leading, 5)
            
            Spacer()
            
            Text("Recover")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 80, height: 40)
                .padding(.trailing, 15)
        }
        .background(Color("cardBackground"))
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
