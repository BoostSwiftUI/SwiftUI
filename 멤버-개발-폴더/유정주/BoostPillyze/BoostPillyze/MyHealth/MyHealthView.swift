//
//  MyHealthView.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/13/24.
//

import SwiftUI
import Combine

struct MyHealthView: View {
    
    private(set) var didTapHealthScoreButton = PassthroughSubject<Void, Never>()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            Header()
            
            ScrollView {
                VStack(spacing: 0) {
                    CalendarList()
                        .frame(height: 80, alignment: .top)
                        .background(Color.primaryNormal)
                    
                    ContentBackground()
                    
                    VStack(spacing: 0) {
                        HealthScoreView(didTapHealthScoreButton: didTapHealthScoreButton)
                            .shadow(color: .primaryNormal.opacity(0.1), radius: 16)
                            .padding(20)
                        
                        VStack(spacing: 20) {
                            DietView()
                                .shadow(color: .primaryNormal.opacity(0.1), radius: 16)
                            DietView()
                                .shadow(color: .primaryNormal.opacity(0.1), radius: 16)
                        }
                        .padding(.horizontal, 20)
                    }
                    .offset(y: -ContentBackground.height)
                }
                
                Spacer()
                    .frame(height: 89)
            }
        }
        .background(Color.primaryPlaceholder)
    }
}

// MARK: - Header

private struct Header: View {
    
    var body: some View {
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

// MARK: - Content Background

private struct ContentBackground: View {
    
    private(set) static var height: CGFloat = 50
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: Self.height)
                .foregroundStyle(Color.primaryNormal)
            Rectangle()
                .foregroundStyle(Color.primaryPlaceholder)
                .cornerRadius(24, corners: [.topLeft, .topRight])
        }
    }
}

// MARK: - HealthScoreView

private struct HealthScoreView: View {
    
    var didTapHealthScoreButton: PassthroughSubject<Void, Never>
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("오늘 내 식사,\n몇 점짜리 식단일까?")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .bold))
                Image(.myHealthScore)
                Text("잘 먹어야 건강해요")
                    .foregroundStyle(.primaryNormal)
                    .padding(.vertical, 4)
                Button(
                    action: {
                        didTapHealthScoreButton.send()
                    },
                    label: {
                        HStack {
                            Spacer()
                            Text("내 식단 점수 확인하기")
                                .font(.system(size: 18, weight: .medium))
                            Spacer()
                        }
                        .padding(.vertical, 16)
                        .foregroundStyle(Color.background)
                        .background(.primaryNormal)
                        .cornerRadius(8, corners: .allCorners)
                    }
                )
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 8)
            Spacer()
        }
        .background(Color.background)
        .cornerRadius(24, corners: [.allCorners])
    }
}

// MARK: - DietView

private struct DietView: View {
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                Text("식단")
                    .font(.system(size: 14))
                Text("0 kcal")
                    .font(.system(size: 18, weight: .bold))
                HStack {
                    Color.purple
                        .frame(width: 12, height: 12)
                        .cornerRadius(3, corners: .allCorners)
                    Text("탄")
                        .font(.system(size: 14))
                    Text("0%")
                        .font(.system(size: 14, weight: .bold))
                }
                HStack {
                    Color.blue
                        .frame(width: 12, height: 12)
                        .cornerRadius(3, corners: .allCorners)
                    Text("단")
                        .font(.system(size: 14))
                    Text("0%")
                        .font(.system(size: 14, weight: .bold))
                }
                HStack {
                    Color.green
                        .frame(width: 12, height: 12)
                        .cornerRadius(3, corners: .allCorners)
                    Text("지")
                        .font(.system(size: 14))
                    Text("0%")
                        .font(.system(size: 14, weight: .bold))
                }
            }
            
            Spacer()
            
            VStack {
                Spacer()
                Image(.myHealthDiet)
                    .resizable()
                    .frame(width: 131, height: 103)
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 18)
        .background(Color.background)
        .cornerRadius(24, corners: [.allCorners])
    }
}

// MARK: - Preview

#Preview {
    MyHealthView()
}
