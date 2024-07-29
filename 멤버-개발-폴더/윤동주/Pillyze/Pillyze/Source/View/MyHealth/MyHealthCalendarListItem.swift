//
//  MyHealthCalendarListItem.swift
//  Pillyze
//
//  Created by 윤동주 on 7/16/24.
//

import SwiftUI

struct MyHealthCalendarListItem: View {
    var weekDay: String
    var day: Int
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                if isSelected {
                    Circle()
                        .fill(.white)
                        .frame(width: 24, height: 24)
                }
                Text(weekDay)
                    .font(.Pretendard.regular(.size12).font)
                    .foregroundStyle(isSelected ? .primaryPurple : .disabledPurple)
            }.frame(width: 30, height: 30)
            Text("\(day)")
                .font(.Pretendard.bold(.size14).font)
                .foregroundStyle(.white)
        }
        .frame(width: 50, height: 80)
    }
}

#Preview {
    MyHealthCalendarListItem(weekDay: "월", day: 15, isSelected: true)
}
