//
//  CTAButtonStyle.swift
//  PillyzeClone
//
//  Created by Mason Kim on 7/16/24.
//

import SwiftUI

extension ButtonStyle where Self == CTAButtonStyle {
    static var cta: CTAButtonStyle {
        CTAButtonStyle()
    }
}

// MARK: - Style

struct CTAButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed

        return configuration.label
            .font(.pretendard(.medium, size: 18))
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
            .foregroundStyle(.white)
            .background(backgroundColor(isPressed: isPressed))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .sensoryFeedback(.impact(weight: .light), trigger: configuration.isPressed)
    }
}

// MARK: - Inner Functions

private extension CTAButtonStyle {
    func backgroundColor(isPressed: Bool) -> Color {
        guard isEnabled else { return .primaryDisabled }
        return .primaryNormal.opacity(isPressed ? 0.8 : 1)
    }
}

// MARK: - Preview

#Preview {
    VStack {
        Button("Hello World") {

        }
        .buttonStyle(.cta)
    }
}
