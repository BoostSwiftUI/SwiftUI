//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 유정주 on 6/29/24.
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
