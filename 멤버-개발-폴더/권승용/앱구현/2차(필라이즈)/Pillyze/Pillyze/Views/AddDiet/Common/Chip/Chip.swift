//
//  Chip.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import SwiftUI

struct Chip: View {
    let title: String
    @Binding var isEnabled: Bool
    
    var body: some View {
        Text(title)
            .font(.system(size: 16))
            .fontWeight(.medium)
            .foregroundStyle(isEnabled ? .textButton : .textPlaceholder)
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            .background {
                RoundedRectangle(cornerRadius: 99)
                    .foregroundStyle(isEnabled ? .appPrimary : .componentBackground)
            }
            .overlay {
                if !isEnabled {
                    RoundedRectangle(cornerRadius: 99)
                        .stroke(.appDisabled, lineWidth: 1)
                }
            }
    }
}

#Preview {
    Group {
        Chip(title: "인기", isEnabled: .constant(true))
        Chip(title: "인기", isEnabled: .constant(false))
    }
}
