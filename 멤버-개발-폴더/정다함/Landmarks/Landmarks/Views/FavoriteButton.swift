//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by MaraMincho on 7/2/24.
//

import Foundation
import SwiftUI

struct FavoriteButton: View {
  @Binding var isSet: Bool


  var body: some View {
    Button {
      isSet.toggle()
    } label: {
      /// help voice over
      Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
        .labelStyle(.iconOnly)
        .foregroundStyle(isSet ? .yellow : .gray)

      Image("start.fill")
        .resizable()
    }
  }
}


#Preview {
  FavoriteButton(isSet: .constant(true))
}
