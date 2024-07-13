//
//  ContentView.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = Tab.myHealth
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .myHealth:
                MyHealthRepresentView()
            case .nutrients:
                Spacer()
                Text("Selected Tab: \(selectedTab)")
                Spacer()
            }
            
            MainTabBar(selectedTab: $selectedTab)
        }
        .background(Color.white)
    }
}

#Preview {
    ContentView()
}
