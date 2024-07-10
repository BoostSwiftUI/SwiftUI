//
//  CoupangApp.swift
//  Coupang
//
//  Created by 홍승현 on 7/7/24.
//

import SwiftUI

@main
struct CoupangApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(ModelData())
    }
  }
}
