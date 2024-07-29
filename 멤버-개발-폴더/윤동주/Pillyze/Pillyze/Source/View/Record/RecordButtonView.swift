//
//  RecordButtonView.swift
//  Pillyze
//
//  Created by 윤동주 on 7/30/24.
//

import SwiftUI

enum MealTime: String, CaseIterable {
    case breakfast = "아침"
    case lunch = "점심"
    case dinner = "저녁"
}

struct RecordButtonView: View {
    
    @State var mealTime: MealTime = .breakfast
    
    var body: some View {
        HStack {
            Menu {
                ForEach(MealTime.allCases, id: \.self) { time in
                    Button {
                        self.mealTime = time
                    } label: {
                        Text("\(time.rawValue)")
                    }
                }
            } label: {
                HStack {
                    Text(mealTime.rawValue)
                        .foregroundStyle(.primaryPurple)
                    Image(.arrowDown)
                        .renderingMode(.template)
                        .tint(.primaryPurple)
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 8.5)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .background(.placeholderPurple)
            }
            
            Text("에")
            Button {
                print("기록하기 버튼 Clicked")
            } label: {
                Text("기록하기")
                    .foregroundStyle(.white)
                    .font(.Pretendard.regular(.size18).font)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14.5)
                    .background(Color(hex: "ECE8FF"))
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.leading, 29)
            
        }
        .frame(height: 67)
        .padding(.horizontal, 20)
    }
}

#Preview {
    RecordButtonView()
}
