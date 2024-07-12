//
//  ContentView.swift
//  pillyze
//
//  Created by 홍승현 on 7/12/24.
//

import SwiftUI

struct ContentView: View {
  @State private var index: Int = 0
  var body: some View {
    VStack {
      Spacer()
      PillyzeTabBar(index: $index)
    }
    .background(Color.pillyzeBackground.ignoresSafeArea(edges: .top))
  }
}


private enum Metrics {
  static let tabBarHeight: CGFloat = 60
}

#Preview {
  ContentView()
}
