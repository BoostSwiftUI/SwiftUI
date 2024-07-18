//
//  MyHealthSectionStack.swift
//  Pillyze
//
//  Created by 윤동주 on 7/16/24.
//

import SwiftUI

struct MyHealthSectionStack<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .shadow(color: .primaryPurple.opacity(0.1), radius: 24, x: 0, y: 0)
            .padding(20)
            .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}
