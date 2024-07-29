//
//  ChipButton.swift
//  Pillyze
//
//  Created by 윤동주 on 7/21/24.
//

import SwiftUI

struct ChipButton: View {
    var element: FilteringMenu
    var selectedFilter: FilteringMenu
    var setFilter: ()->Void
    
    var isSelected: Bool {
        selectedFilter == element
    }
    
    
    var body: some View {
        Button {
            setFilter()
        } label: {
            Text(element.rawValue)
                .font(.Pretendard.medium(.size16).font)
                .frame(maxWidth: .infinity)
                .padding(4)
                .foregroundStyle(isSelected ? .white : .placeholderGray)
                .background(RoundedRectangle(cornerRadius: 99)
                    .fill(isSelected ? .primaryPurple : .white))
                .overlay(RoundedRectangle(cornerRadius: 99)
                    .stroke(lineWidth: 1)
                    .fill(isSelected ? .clear : .placeholderGray)
                )
                
        }
        .frame(width: 60, height: 28)
    }
}

#Preview {
    ChipButton(element: .all, selectedFilter: .all, setFilter: {})
}
