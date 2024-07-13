//
//  MainTabBar.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/13/24.
//

import SwiftUI

enum Tab {
    
    case myHealth
    case supplement
}

struct MainTabBar: View {
    
    // MARK: - Binding
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            
        }
        .cornerRadius(24, corners: [.topLeft, .topRight])
    }
}

#Preview {
    @State var selectedTab = Tab.myHealth
    return MainTabBar(selectedTab: $selectedTab)
}
