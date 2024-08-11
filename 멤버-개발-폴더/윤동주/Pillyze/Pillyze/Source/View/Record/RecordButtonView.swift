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
    @State private var shouldShowText: Bool = false
    
    @Binding var isLottieAnimationShown: Bool
    @Binding var selectedFoods: [RankingFood]
    
    var body: some View {
        VStack {
            if shouldShowText {
                Text("음식이 추가되었어요.")
                    .font(.Pretendard.regular(.size16).font)
            }
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
                            .font(.Pretendard.bold(.size20).font)
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
                    Text(selectedFoods.count > 0 ? "\(selectedFoods.count)개 기록하기" : "기록하기")
                        .foregroundStyle(.white)
                        .font(.Pretendard.regular(.size18).font)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14.5)
                        .background(selectedFoods.count > 0 ? .primaryPurple : Color(hex: "ECE8FF"))
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.leading, 29)
                
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 8)
        .onChange(of: isLottieAnimationShown) { _, newValue in
            if newValue {
                shouldShowText = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    shouldShowText = false
                }
            }
        }
        .animation(.easeInOut, value: shouldShowText)
    }
}

#Preview {
    RecordButtonView(isLottieAnimationShown: .constant(false),
                     selectedFoods: .constant([RankingFood(name: "a",
                                                           unit: "b",
                                                           calory: 100,
                                                           rank: 2,
                                                           rankChange: -2)]))
}
