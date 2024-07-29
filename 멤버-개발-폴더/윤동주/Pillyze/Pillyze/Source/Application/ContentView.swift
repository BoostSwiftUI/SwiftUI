//
//  ContentView.swift
//  Pillyze
//
//  Created by 윤동주 on 7/16/24.
//

import SwiftUI

enum TabCategory {
    case myHealth
    case nutrients
}

struct ContentView: View {
    @State private var selectedTab: TabCategory = .myHealth
    @State private var isAddSheetShown = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .myHealth:
                MyHealthView()
            case .nutrients:
                NutrientsView()
            }
            TabBar(selectedTab: $selectedTab, isAddSheetShown: $isAddSheetShown)
        }
        .fullScreenCover(isPresented: $isAddSheetShown) {
            RecordView(isAddSheetShown: $isAddSheetShown)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ContentView()
}
