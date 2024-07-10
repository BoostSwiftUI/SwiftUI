//
//  Section6View.swift
//  Landmarks
//
//  Created by 홍승현 on 7/2/24.
//

import SwiftUI

struct ContentView: View {

  @State private var selectedTab: Tabs = .featured

  enum Tabs: Equatable, Hashable {
    case featured
    case list
  }

  var body: some View {
    if #available(iOS 18.0, *) {
      TabView(selection: $selectedTab) {
        Tab("Featured", systemImage: "star", value: .featured) {
          CategoryHome()
        }

        Tab("List", systemImage: "list.bullet", value: .list) {
          LandmarkList()
        }
      }
    } else {
      TabView(selection: $selectedTab) {
        CategoryHome()
          .tabItem {
            Label("Featured", systemImage: "star")
          }
          .tag(Tabs.featured)
        LandmarkList()
          .tabItem {
            Label("List", systemImage: "list.bullet")
          }
          .tag(Tabs.list)
      }
    }
  }
}

#Preview {
  ContentView()
    .environment(ModelData())
}
