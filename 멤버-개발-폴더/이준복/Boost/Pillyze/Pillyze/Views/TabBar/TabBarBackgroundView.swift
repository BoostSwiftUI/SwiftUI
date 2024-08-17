//
//  TabBarBackgroundView.swift
//  Pillyze
//
//  Created by 이준복 on 7/15/24.
//

import SwiftUI

struct TabBarBackgroundView: View {
    // MARK: - Body
    var body: some View {
        UnevenRoundedRectangle(
            cornerRadii: RectangleCornerRadii(
                topLeading: 24,
                topTrailing: 24
            )
        )
        .foregroundStyle(.appBackground)
        .shadow(color: .appShadow, radius: 16)
        .frame(height: 60)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    TabBarBackgroundView()
}
