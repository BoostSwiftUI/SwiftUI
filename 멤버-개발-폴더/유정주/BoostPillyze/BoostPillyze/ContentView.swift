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
        ZStack {
            switch selectedTab {
            case .myHealth:
                MyHealthRepresentView()
                    .ignoresSafeArea()
            case .nutrients:
                Text("Selected Tab: \(selectedTab)")
            }
            
            VStack {
                Spacer()
                MainTabBar(selectedTab: $selectedTab)
            }
        }
        .background(Color.background)
    }
}

#Preview {
    ContentView()
}
