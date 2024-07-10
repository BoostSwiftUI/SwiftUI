//
//  ContentView.swift
//  Coupang
//
//  Created by 권승용 on 7/6/24.
//

import SwiftUI

struct ContentView: View {
    let model = ModelData()
    
    var body: some View {
        Home(model: model)
    }
}

#Preview {
    ContentView()
}
