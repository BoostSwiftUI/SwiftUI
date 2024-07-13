//
//  CoupangViewPracticeApp.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/8/24.
//

import SwiftUI

@main
struct CoupangViewPracticeApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environment(modelData)
                    .environment(\.locale, .init(identifier: "ko"))
            }
        }
    }
}
