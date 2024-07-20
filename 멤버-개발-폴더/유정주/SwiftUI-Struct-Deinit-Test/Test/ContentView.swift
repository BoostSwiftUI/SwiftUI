//
//  ContentView.swift
//  Test
//
//  Created by 유정주 on 7/18/24.
//

import SwiftUI

final class DummyClass {
    
    let id = String(Array(UUID().uuidString)[..<6])
    
    init() {
        print("DummyClass init: \(id)")
    }
    
    deinit {
        print("DummyClass deinit: \(id)")
    }
}

struct ContentView: View {

    @State var count = 0
    
    init() {
        print("Content Init")
    }
    
    var body: some View {
        let _ = print("Content Body")
        
        AView()
        Button(
            action: {
                let _ = print("Click Content Button")
                count += 1
            }, label: {
                Text("Content Button: \(count)")
            }
        )
    }
}

struct AView: View {
    
    @State var count = 0
    private let dummyClass = DummyClass()
    
    init() {
        print("A Init: \(dummyClass.id)")
    }
    
    var body: some View {
        let _ = print("A Body: \(dummyClass.id)")
        
        Button(
            action: {
                let _ = print("Click A Button")
                count += 1
            }, label: {
                Text("A Button: \(count)")
            }
        )
    }
}

#Preview {
    ContentView()
}
