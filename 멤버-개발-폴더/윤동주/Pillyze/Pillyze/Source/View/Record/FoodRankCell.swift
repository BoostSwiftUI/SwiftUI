//
//  FoodRankCell.swift
//  Pillyze
//
//  Created by 윤동주 on 7/25/24.
//

import SwiftUI
import DotLottie

struct FoodRankCell: View {
    
    @Binding var selectedFoods: [RankingFood]
    @Binding var isLottieAnimationShown: Bool
    
    var food: RankingFood
    var index: Int
    
    var isSelectedItem: Bool {
        selectedFoods.contains(food)
    }
    
    var body: some View {
        ZStack {
            HStack {
                Text("\(index)")
                    .font(.Pretendard.medium(.size16).font)
                Image(food.rankChange == 0 ? "noChange" : food.rankChange > 0 ? "arrowUp" : "arrowDown")
                VStack(alignment: .leading, spacing: 2) {
                    Text(food.name)
                    Text(food.unit)
                        .foregroundStyle(.placeholderGray)
                }
                .font(.Pretendard.regular(.size16).font)
                Spacer()
                HStack(spacing: 12) {
                    Text("\(food.calory)Kcal")
                        .font(.Pretendard.medium(.size16).font)
                        .foregroundStyle(.secondaryText)
                    Button {
                        if let index = selectedFoods.firstIndex(of: food) {
                            selectedFoods.remove(at: index)
                        } else {
                            selectedFoods.append(food)
                        }
                        withAnimation {
                            if isSelectedItem {
                                isLottieAnimationShown = true
                            }
                        }
                    } label: {
                        Image(isSelectedItem ? "purpleCheck" : "purpleAdd")
                            .rotationEffect(.degrees(isSelectedItem ? 360 : 0))
                            .animation(.easeInOut(duration: 0.4), value: isSelectedItem)
                    }
                    .sensoryFeedback(.increase, trigger: isSelectedItem)
                }
            }
            .padding(.vertical, 6)
        }
    }
}

#Preview {
    FoodRankCell(selectedFoods: .constant([]),
                 isLottieAnimationShown: .constant(false),
                 food: RankingFood.previewData,
                 index: 4)
}
