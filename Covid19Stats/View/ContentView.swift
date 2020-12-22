//
//  ContentView.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 17/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            RecentView()
                .tabItem {
                    Tab(imageName: "chart.bar", text: "Recent")
                }
                .tag(0)
            
            MapContainerView()
                .edgesIgnoringSafeArea(.vertical)
                .tabItem {
                    Tab(imageName: "map", text: "Map")
                }
                .tag(1)
        }
    }
}

private struct Tab: View {
    
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}
