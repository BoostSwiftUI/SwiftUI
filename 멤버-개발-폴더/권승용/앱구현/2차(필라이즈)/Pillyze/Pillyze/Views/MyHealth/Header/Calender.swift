//
//  Calender.swift
//  Pillyze
//
//  Created by 권승용 on 7/13/24.
//

import SwiftUI

struct Calender: View {
    let days = ["월", "화", "수", "목", "금", "토", "일"]
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Spacer()
                ForEach(0..<days.count, id: \.self) { index in
                    calenderComponent(weekdays: days[index], daysInMonth: index + 10)
                    Spacer()
                }
            }
            
        }
        .background {
            Color(.appPrimary)
        }
    }
    
    @ViewBuilder
    func calenderComponent(weekdays: String, daysInMonth: Int ) -> some View {
        VStack(spacing: 12) {
            Text(weekdays)
                .font(.system(size: 12))
                .fontWeight(.regular)
                .foregroundStyle(weekdays == "월" ? .appPrimary : .white)
                .opacity(weekdays == "월" ? 1 : 0.5)
                .frame(width: 24, height: 24)
                .background {
                    if weekdays == "월" {
                        Circle()
                            .fill(.white)
                    }
                }
            
            Text("\(daysInMonth)")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(width: 24, height: 24)
        }
        .padding(.top, 4)
        .padding(.bottom, 16)
    }
}

#Preview {
    Calender()
}
