//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by MaraMincho on 7/2/24.
//

import SwiftUI
// An app that uses the SwiftUI app life cycle
// has a structure that conforms to the App protocol.
// The structure’s body property returns one or more scenes,
// which in turn provide content for display.
// The @main attribute identifies the app’s entry point.
@main
struct LandmarksApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(ModelData())
    }
  }
}
