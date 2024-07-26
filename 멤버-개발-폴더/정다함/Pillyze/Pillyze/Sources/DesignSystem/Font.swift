//
//  Font.swift
//  Pillyze
//
//  Created by MaraMincho on 7/26/24.
//

import SwiftUI

extension Font {
  static func registerFont() {
    let fontName = ["Pretendard-Regular", "Pretendard-Bold", "Pretendard-Medium"]
    let urls = fontName.compactMap { Bundle.main.url(forResource: $0, withExtension: "otf") }
    urls.forEach { CTFontManagerRegisterFontsForURL($0 as CFURL, .process, nil) }
  }
}

enum FLFontType {
  case regular
  case medium
  case bold

  var fontName: String {
    switch self {
    case .regular:
      "Pretendard-Regular"
    case .medium:
      "Pretendard-Medium"
    case .bold:
      "Pretendard-Bold"
    }
  }
}

enum FLFontSize:CGFloat {
  case _24 = 24
  case _20 = 20
  case _18 = 18
  case _16 = 16
  case _14 = 14
  case _12 = 12
}

extension View {
  func applyFont(_ font: FLFontType, size: FLFontSize) -> some View {
    let lineHeightSpacingWeight = 0.2
    let lineSpacing = (size.rawValue * lineHeightSpacingWeight)
    let linePadding = lineSpacing / 2

    return self
      .font(.custom(font.fontName, size: size.rawValue))
      .padding(.vertical, linePadding)
      .tracking(Constants.FLLetterSpacing)
  }

}

fileprivate enum Constants {
  static let FLLetterSpacing: CGFloat = -0.5
}

