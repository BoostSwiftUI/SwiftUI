//
//  FoodRankCell.swift
//  Pillyze
//
//  Created by 윤동주 on 7/25/24.
//

import SwiftUI

struct FoodRankCell: View {
    var food: RankingFood
    var index: Int
    
    var body: some View {
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
                    print("더하기 버튼 눌림")
                } label: {
                    Image("purpleAdd")
                }
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    FoodRankCell(food: RankingFood.previewData, index: 4)
}
