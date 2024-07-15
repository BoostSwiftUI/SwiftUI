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
        VStack {
            chipButtons()
            
            ScrollView {
                VStack {
                    FoodList(foods: foods, isRankedList: false)
                }
            }
        }
    }
    
    @ViewBuilder
    func chipButtons() -> some View {
        HStack {
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

#Preview {
    Favorites(foods: ModelData().foods)
}
