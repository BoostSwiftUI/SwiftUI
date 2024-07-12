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
  }
}

#Preview {
  ContentView()
}
