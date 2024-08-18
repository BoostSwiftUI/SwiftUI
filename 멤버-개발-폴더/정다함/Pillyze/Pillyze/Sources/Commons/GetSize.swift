//
//  GetSize.swift
//  Pillyze
//
//  Created by MaraMincho on 7/29/24.
//

import SwiftUI

extension View {
  func getSize(sizedChanged: @escaping (CGSize) -> Void) -> some View {
    modifier(GetSizeModifier(
      sizedChanged: sizedChanged
    ))
  }
}

// MARK: - GetSizeModifier

struct GetSizeModifier: ViewModifier {
  let sizedChanged: (CGSize) -> Void

  init(sizedChanged: @escaping (CGSize) -> Void) {
    self.sizedChanged = sizedChanged
  }

  func body(content: Content) -> some View {
    content
      .background(
        GeometryReader { geometry in
          Color.clear
            .preference(key: SizePreferenceKey.self, value: geometry.size)
            .onPreferenceChange(SizePreferenceKey.self) { sizedChanged($0) }
        }
      )
  }
}

// MARK: - SizePreferenceKey

final class SizePreferenceKey: PreferenceKey {
  typealias Value = CGSize
  static var defaultValue: Value = .zero

  static func reduce(value _: inout Value, nextValue: () -> Value) {
    _ = nextValue()
  }
}
