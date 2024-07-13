//
//  ContentView.swift
//  Pillyze
//
//  Created by 권승용 on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var component: TabBarComponents = .myHealth
    
    var body: some View {
        ZStack {
            Color(.appPrimary)
                .ignoresSafeArea()
            
            switch component {
            case .myHealth:
                MyHealth()
            case .nutrients:
                Text("nutrients")
            }
            
            TabBar(components: $component)
        }
    }
}

#Preview {
    ContentView()
}
