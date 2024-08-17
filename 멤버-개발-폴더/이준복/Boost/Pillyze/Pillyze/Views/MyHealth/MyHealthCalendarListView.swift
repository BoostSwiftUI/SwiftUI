//
//  MyHealthCalendarListView.swift
//  Pillyze
//
//  Created by 이준복 on 7/15/24.
//

import SwiftUI

struct MyHealthCalendarListView: View {
    
    // MARK: - Attributes
    private let dates = ["월", "화", "수", "목", "금", "토", "일"]
    private let days = Array(1...31)
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack() {
                ForEach(0..<31) { index in
                        MyHealthCalendarListItemView(
                            isToday: index == 0,
                            date: dates[index % 7],
                            day: days[index]
                        )
                }
            }
            
        }
        .padding(.bottom, 16)
        .background(.primaryNormal)
    }
}

#Preview {
    MyHealthCalendarListView()
}
