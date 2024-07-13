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
            Spacer()
            Text("Selected Tab: \(selectedTab)")
            Spacer()
            
            MainTabBar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentView()
}
