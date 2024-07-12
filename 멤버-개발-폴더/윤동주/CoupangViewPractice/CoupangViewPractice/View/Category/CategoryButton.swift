//
//  CategoryItemButton.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/9/24.
//

import SwiftUI

struct CategoryItemButton: View {
    var category: Category
    
    var body: some View {
        Button {
            print("\(LocalizedStringKey(category.categoryName)) 클릭됨")
        } label: {
            HStack(spacing: 10) {
                Text(category.categoryIcon)
                Text(LocalizedStringKey(category.categoryName))
            }
            Spacer()
        }
        .tint(.black)
    }
}

#Preview {
    CategoryItemButton(category: Category(categoryName: "Technology", categoryIcon: "💻"))
}
