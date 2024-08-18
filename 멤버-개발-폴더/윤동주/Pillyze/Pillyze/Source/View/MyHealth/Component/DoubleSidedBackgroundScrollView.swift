//
//  DoubleSidedBackgroundScrollView.swift
//  Pillyze
//
//  Created by 윤동주 on 7/20/24.
//

import SwiftUI

struct DoubleSidedBackgroundScrollView<Content: View>: View {

    private let ContentBuilder: () -> Content
    private let topColor: Color
    private let bottomColor: Color
    
    @State private var offset: CGFloat = .zero
    
    init(topColor: Color, 
         bottomColor: Color,
         contentBuilder: @escaping () -> Content) {
        self.ContentBuilder = contentBuilder
        self.topColor = topColor
        self.bottomColor = bottomColor
    }

    var body: some View {
        ScrollView {
            ZStack {
                ContentBuilder()
            
                GeometryReader { proxy in
                    let offset = proxy.frame(in: .named("scroll")).minY
                    Color.clear.preference(key: ScrollViewOffsetPreferenceKey.self, value: offset)
                }
            }
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
            offset = value
        }
        .background(
            VStack(spacing: 0) {
                topColor
                    .frame(
                        height: max(offset + (UIScreen.main.bounds.height / 2), 0),
                        alignment: .top)
                bottomColor
            }
            .ignoresSafeArea()
        )
    }
}

private struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// Reference Code
/*
 stackoverflow.com/questions/71179919/swiftui-can-you-have-a-different-background-color-for-the-top-and-bottom-of-a-s
 */
