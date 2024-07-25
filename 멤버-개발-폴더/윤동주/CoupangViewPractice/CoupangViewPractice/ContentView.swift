//
//  ContentView.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CategoryView()
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
