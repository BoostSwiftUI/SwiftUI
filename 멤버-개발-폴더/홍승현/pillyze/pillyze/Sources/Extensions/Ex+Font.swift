//
//  Ex+Font.swift
//  Pillyze
//
//  Created by Hyun on 7/22/24.
//

import SwiftUI

extension Font {
  enum PretendardWeight: String {
    case thin
    case extraLight
    case light
    case regular
    case medium
    case semiBold
    case bold
    case extraBold
    case black
  }

  static func pretendard(size: CGFloat, weight: PretendardWeight) -> Self {
    .custom("Pretendard-\(weight.rawValue.capitalized)", size: size)
  }
}
