//
//  FoodListRow.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import SwiftUI

struct FoodListRow: View {
    let food: Food
    let isRankedList: Bool
    
    var body: some View {
        ZStack {
            if isRankedList {
                foodRank()
            }
            FoodInfo(food: food, isRankedList: isRankedList)
                .padding(.leading, isRankedList ? 48 : 20)
        }
    }
    
    @ViewBuilder
    func foodRank() -> some View {
        HStack {
            Text("\(food.currentRank)")
                .font(.system(size: 16))
                .fontWeight(.heavy)
                .foregroundStyle(.textNormal)
            Spacer()
        }
        .padding(.leading, 20)
    }
}

#Preview {
    FoodListRow(food: ModelData().foods.first!, isRankedList: true)
        .environment(ModelData())
}
