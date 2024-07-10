//
//  Week2_CupangApp.swift
//  Week2_Cupang
//
//  Created by MaraMincho on 7/9/24.
//

import SwiftUI

@main
struct Week2_CupangApp: App {
  var body: some Scene {
    WindowGroup {
      CategoryView(categoryViewModel: .init())
    }
  }
}
