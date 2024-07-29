//
//  Favorites.swift
//  Pillyze
//
//  Created by 권승용 on 7/16/24.
//

import SwiftUI

struct Favorites: View {
    let foods: [Food]
    
    var body: some View {
        ZStack {
            Color.componentBackground
            
            VStack(spacing: 0) {
                chipButtons()
                
                if foods.isEmpty {
                    Image(.favoritesPlaceholder)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 335, height: 335)
                        .padding(.horizontal, 20)
                        .padding(.top, 54)
                    Spacer()
                } else {
                    ScrollView {
                        VStack {
                            FoodList(foods: foods, isRankedList: false)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func chipButtons() -> some View {
        HStack(spacing: 10) {
            Chip(title: "전체", isEnabled: .constant(true))
            Chip(title: "음식", isEnabled: .constant(false))
            Chip(title: "세트", isEnabled: .constant(false))
            Chip(title: "레시피", isEnabled: .constant(false))
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.vertical, 11)
    }
}

#Preview("With data") {
    Favorites(foods: ModelData().foods)
        .environment(ModelData())
}

#Preview("No data") {
    Favorites(foods: [])
        .environment(ModelData())
}
