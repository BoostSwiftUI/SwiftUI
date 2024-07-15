//
//  FoodList.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import SwiftUI

struct FoodList: View {
    let foods: [Food]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0){
                ForEach(foods) { food in
                    FoodListRow(food: food, isRankedList: true)
                    Divider()
                        .padding(.horizontal, 20)
                }
            }
        }
    }
}

#Preview {
    FoodList(foods: ModelData().foods)
}
