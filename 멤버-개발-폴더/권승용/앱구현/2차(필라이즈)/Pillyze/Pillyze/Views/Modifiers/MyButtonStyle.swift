//
//  MyButtonStyle.swift
//  Pillyze
//
//  Created by 권승용 on 7/13/24.
//

import SwiftUI

struct MyButtonStyle: ViewModifier {
    var isEnabled: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18))
            .fontWeight(.medium)
            .foregroundStyle(.textButton)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(isEnabled ? .appPrimary : .appPrimaryDisabled)
            }
    }
}

extension View {
    func myButtonStyle(isEnabled: Bool = true) -> some View {
        modifier(MyButtonStyle(isEnabled: isEnabled))
    }
}

