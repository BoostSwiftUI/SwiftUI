//
//  ButtonBackground.swift
//  Pillyze
//
//  Created by 권승용 on 7/13/24.
//

import SwiftUI

struct ButtonBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.appPrimary)
            }
    }
}

extension View {
    func buttonBackground() -> some View {
        modifier(ButtonBackground())
    }
}

