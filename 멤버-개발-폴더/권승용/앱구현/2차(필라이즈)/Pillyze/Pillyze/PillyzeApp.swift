//
//  PillyzeApp.swift
//  Pillyze
//
//  Created by 권승용 on 7/12/24.
//

import SwiftUI

@main
struct PillyzeApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
