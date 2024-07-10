//
//  CategoryItem.swift
//  BoostCoupang
//
//  Created by 유정주 on 7/7/24.
//

import SwiftUI

struct CategoryItem: View {
    
    let category: Category
    
    var body: some View {
        HStack {
            Text(category.icon)
            Text(category.name)
            Spacer()
        }
        .padding(.init(top: 0, leading: 5, bottom: 0, trailing: 0))
    }
}

#Preview {
    CategoryItem(category: Category(name: "카테고리1", icon: "🥰"))
}
