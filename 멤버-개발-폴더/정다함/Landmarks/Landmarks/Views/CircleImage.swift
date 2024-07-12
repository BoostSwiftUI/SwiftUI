//
//  CircleImage.swift
//  Landmarks
//
//  Created by MaraMincho on 7/2/24.
//

import SwiftUI

struct CircleImage: View {
  var image: Image
  var body: some View {
    Image("MealGokLogo")
      .clipShape(Circle())
      .overlay {
        Circle()
          .stroke(.white, lineWidth: 4)
      }
      .shadow(radius: 7)
  }
}

#Preview {
    CircleImage(image: Image("MealGokLogo"))
}
