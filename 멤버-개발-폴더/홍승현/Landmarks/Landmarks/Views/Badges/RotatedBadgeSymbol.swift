//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by 홍승현 on 7/3/24.
//

import SwiftUI

struct RotatedBadgeSymbol: View {

  let angle: Angle

  var body: some View {
    BadgeSymbol()
      .padding(-60)
      .rotationEffect(angle, anchor: .bottom)
  }
}

#Preview {
  RotatedBadgeSymbol(angle: .init(degrees: 5))
}
