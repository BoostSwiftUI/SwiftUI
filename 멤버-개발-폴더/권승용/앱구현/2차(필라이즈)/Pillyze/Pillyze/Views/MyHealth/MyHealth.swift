//
//  MyHealth.swift
//  Pillyze
//
//  Created by 권승용 on 7/13/24.
//

import SwiftUI

struct MyHealth: View {
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color(.appPrimary)
                Color(.componentBackground)
            }
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 0) {
                    Spacer()
                        .frame(height: 46)
                    Calender()
                   
                    VStack {
                        VStack(spacing: 16) {
                            MyDiets()
                            ForEach(0...6, id: \.self) { _ in
                                Diet()
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                    }
                    .frame(maxWidth: .infinity)
                    .background {
                        UnevenRoundedRectangle(
                            cornerRadii: RectangleCornerRadii(
                                topLeading: 24,
                                topTrailing: 24
                            )
                        )
                        .foregroundStyle(.componentBackground)
                    }
                }
            }
            
            MyHealthHeader()
        }
    }
}

#Preview {
    MyHealth()
}

private struct MyHealthHeader: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                VStack {
                    Spacer()
                        .frame(height: proxy.safeAreaInsets.top)
                    Header()
                }
                .background {
                    ZStack {
                        TransparentBlurView(removeAllFilters: false)
                        Color(.appPrimary).opacity(0.9)
                    }
                }
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}
