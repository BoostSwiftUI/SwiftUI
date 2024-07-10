//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 이준복 on 7/1/24.
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
