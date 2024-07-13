//
//  ComponentBackground.swift
//  Pillyze
//
//  Created by 권승용 on 7/13/24.
//

import SwiftUI

struct ComponentBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: 24)
                    .foregroundStyle(.componentBackground)
                    .shadow(color: Color(.appShadow), radius: 16)
            }
    }
}

extension View {
    func componentBackground() -> some View {
        modifier(ComponentBackground())
    }
}
