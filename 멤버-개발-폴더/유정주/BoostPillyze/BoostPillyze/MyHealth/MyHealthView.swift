//
//  MyHealthView.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/13/24.
//

import SwiftUI

struct MyHealthView: View {
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image(.logo)
                    Spacer()
                    HStack {
                        Button(
                            action: {},
                            label: { Image(.headerCalendar) }
                        )
                        Button(
                            action: {},
                            label: { Image(.headerNotification) }
                        )
                        Button(
                            action: {},
                            label: { Image(.headerProfile) }
                        )
                    }
                }
                .padding(.horizontal)
                
                CalendarList()
            }
        }
        .background(Color.primaryNormal)
    }
}

// MARK: - Calendar

private struct CalendarList: View {
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<31) { index in
                    CalendarListItem(
                        isToday: index == 0,
                        week: dates[index % 7],
                        day: days[index]
                    )
                }
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: - Attribute
    
    private let dates = ["월", "화", "수", "목", "금", "토", "일"]
    private let days = Array(1...31)
}

private struct CalendarListItem: View {
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            if isToday {
                Text(week)
                    .font(.system(size: 12))
                    .padding()
                    .foregroundStyle(Color.primaryNormal)
                    .background(
                        Circle()
                            .fill(Color.white)
                            .frame(width: 24, height: 24)
                    )
            } else {
                Text(week)
                    .font(.system(size: 12))
                    .padding()
                    .foregroundStyle(Color.primaryDisabled)
            }
            
            Text("\(day)")
                .foregroundStyle(.white)
                .font(.system(size: 14, weight: .bold))
        }
    }
    
    // MARK: - Attribute
    
    private let isToday: Bool
    private let week: String
    private let day: Int
    
    // MARK: - Initializer
    
    init(isToday: Bool, week: String, day: Int) {
        self.isToday = isToday
        self.week = week
        self.day = day
    }
}


// MARK: - Preview

#Preview {
    MyHealthView()
}
