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
        .frame(height: Metrics.tabBarHeight)
        .frame(maxWidth: .infinity)
        .background(
          UnevenRoundedRectangle(
            topLeadingRadius: Metrics.cornerRadius,
            topTrailingRadius: Metrics.cornerRadius
          ).fill(.background)
        )
    }
    .background(Color.pillyzeBackground.ignoresSafeArea(edges: .top))
  }
}


private enum Metrics {
  static let cornerRadius: CGFloat = 35
  static let tabBarHeight: CGFloat = 60
}

#Preview {
  ContentView()
}
