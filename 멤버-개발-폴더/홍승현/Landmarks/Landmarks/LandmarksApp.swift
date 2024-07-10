//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 홍승현 on 7/2/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
  @State private var modelData = ModelData()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(modelData)
    }
  }
}
