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
