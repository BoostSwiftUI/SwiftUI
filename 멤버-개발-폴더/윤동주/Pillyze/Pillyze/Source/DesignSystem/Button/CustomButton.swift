//
//  CustomButton.swift
//  Pillyze
//
//  Created by 윤동주 on 7/16/24.
//

import SwiftUI

struct CustomButton: View {
    let text: String
    let font: Font
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(font)
                .frame(maxWidth: .infinity)
                .padding(.vertical, verticalPadding)
                .padding(.horizontal, horizontalPadding)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}
