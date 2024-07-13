//
//  CategoryItemButton.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/9/24.
//

import SwiftUI

struct CategoryItemButton: View {
    @Environment(ModelData.self) var modelData
    var category: Category
    var products: [Product] {
        self.modelData.products.filter {
            $0.categories.contains(self.category.categoryName)
        }
    }
    
    var body: some View {
        NavigationLink {
            ProductView(products: products)
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
