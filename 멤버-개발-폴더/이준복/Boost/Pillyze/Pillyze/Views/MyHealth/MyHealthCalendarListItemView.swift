//
//  MyHealthCalendarListItemView.swift
//  Pillyze
//
//  Created by 이준복 on 7/15/24.
//

import SwiftUI

struct MyHealthCalendarListItemView: View {
    // MARK: - Attributes
    private let isToday: Bool
    private let date: String
    private let day: Int
    
    // MARK: - Init
    init(isToday: Bool, date: String, day: Int) {
        self.isToday = isToday
        self.date = date
        self.day = day
    }
    
    // MARK: - Body
    var body: some View {
        VStack() {
            if isToday {
                Text(date)
                    .font(.system(size: 12))
                    .padding()
                    .foregroundStyle(.primaryNormal)
                    .background(
                        Circle()
                            .fill(Color.white)
                            .frame(width: 24, height: 24)
                    )
            } else {
                Text(date)
                    .font(.system(size: 12))
                    .padding()
                    .foregroundStyle(.primaryDisabled)
            }
            
            Text("\(day)")
                .foregroundStyle(.white)
                .font(.system(size: 14, weight: .bold))
        }
    }
}

#Preview {
    MyHealthCalendarListItemView(isToday: true, date: "월", day: 1)
}
