//
//  Strikethrough.swift
//  BoostCoupang
//
//  Created by 유정주 on 7/8/24.
//

import SwiftUI

struct Strikethrough: ViewModifier {
    
    var color = Color.gray
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .foregroundStyle(color)
                    .frame(height: 1),
                alignment: .center
            )
    }
}

extension Text {
 
    func strikethroughCompat(color: Color = .black) -> some View {
        modifier(Strikethrough(color: color))
    }
}
