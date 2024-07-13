//
//  ContentView.swift
//  Landmarks
//
//  Created by MaraMincho on 7/2/24.
//

import SwiftUI
import MapKit


// Spacer: A spacer expands to make its containing view use all
// of the space of its parent view, instead of having its
// size defined only by its contents.

// Preview 설명: Your code is always the source of truth for the view.
// When you use the inspector to change or remove a modifier,
// Xcode updates your code immediately to match.

struct ContentView: View {
  var body: some View {
    LandmarkList()
  }

}


// When creating a SwiftUI view, you describe its content,
// layout, and behavior in the view’s body property
//however, the body property only returns a single view.
#Preview {
  ContentView()
}
