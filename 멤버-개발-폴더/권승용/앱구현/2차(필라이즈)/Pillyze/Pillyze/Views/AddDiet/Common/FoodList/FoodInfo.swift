//
//  FoodInfo.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import SwiftUI

struct FoodInfo: View {
    let food: Food
    let isRankedList: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            foodDetail()
            
            Spacer()
            
            HStack(spacing: 12) {
                Text("\(food.caloriesPerUnit)kcal")
                Image(.dietUnselected)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
        }
        .padding(.vertical, 16)
        .padding(.trailing, 20)
    }
    
    @ViewBuilder
    func foodDetail() -> some View {
        HStack(spacing: 6) {
            if isRankedList {
                switch food.rankChangeStatus {
                case .down:
                    Image(.rankDown)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                case .up:
                    Image(.rankUp)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                case .maintain:
                    Image(.rankMaintain)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                }
            } else {
                Image(.rankMaintain)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
            }
            
            VStack(alignment: .leading) {
                Text(food.name)
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .foregroundStyle(.textNormal)
                Text(food.unit)
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .foregroundStyle(.textSecondary)
            }
        }
    }
}


#Preview {
    FoodInfo(food: ModelData().foods.first!, isRankedList: false)
}
