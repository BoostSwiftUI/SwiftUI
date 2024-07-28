//
//  PillyzeApp.swift
//  Pillyze
//
//  Created by MaraMincho on 7/26/24.
//

import SwiftUI

@main
struct PillyzeApp: App {
  init() {
    Font.registerFont()
  }
  var body: some Scene {
    WindowGroup {
      VStack{
        MainHeader()

      }
    }
  }
}
