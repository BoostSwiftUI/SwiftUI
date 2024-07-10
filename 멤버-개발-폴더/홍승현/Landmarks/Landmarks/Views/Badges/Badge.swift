//
//  Badge.swift
//  Landmarks
//
//  Created by 홍승현 on 7/3/24.
//

import SwiftUI

struct Badge: View {

  var badgeSymbols: some View {
    ForEach(0..<8) { index in
      RotatedBadgeSymbol(angle: .degrees(Double(index) / 8) * 360)
        .opacity(0.5)
    }
  }

  var body: some View {
    ZStack {
      BadgeBackground()

      GeometryReader { geometry in
        badgeSymbols
          .scaleEffect(0.25, anchor: .top)
          .position(
            x: geometry.size.width * 0.5,
            y: 0.75 * geometry.size.height
          )
      }
    }
    .scaledToFit()
  }
}

#Preview {
  Badge()
}
