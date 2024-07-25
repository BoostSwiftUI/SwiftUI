//
//  GetSizeModifier.swift
//  PillyzeClone
//
//  Created by Mason Kim on 7/16/24.
//

import SwiftUI

extension View {
    func getSize(sizedChanged: @escaping (CGSize) -> Void) -> some View {
        modifier(GetSizeModifier(
            sizedChanged: sizedChanged
        ))
    }
}

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

final class SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: Value = .zero

    static func reduce(value _: inout Value, nextValue: () -> Value) {
        _ = nextValue()
    }
}

