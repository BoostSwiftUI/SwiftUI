//
//  FoodList.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import SwiftUI

struct FoodList: View {
    let foods: [Food]
    let isRankedList: Bool
    
    var body: some View {
        VStack(spacing: 0){
            ForEach(foods) { food in
                FoodListRow(food: food, isRankedList: isRankedList)
                Divider()
                    .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    FoodList(foods: ModelData().foods, isRankedList: true)
}

#Preview {
    FoodList(foods: ModelData().foods, isRankedList: false)
}
