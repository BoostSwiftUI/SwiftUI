//
//  ContentView.swift
//  pillyze
//
//  Created by 홍승현 on 7/12/24.
//

import SwiftUI

struct ContentView: View {
  @State private var selection: Tabs = .myHealth
  var body: some View {
    VStack {
      TabView(selection: $selection) {
        Text("MyHealth")
          .tag(Tabs.myHealth)
          .toolbar(.hidden, for: .tabBar)

        Text("Nutrients")
          .tag(Tabs.nutrients)
          .toolbar(.hidden, for: .tabBar)
      }

      PillyzeTabBar(activeTab: $selection)
    }
  }
}

#Preview {
  ContentView()
}
