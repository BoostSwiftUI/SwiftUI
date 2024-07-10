//
//  AllCategories.swift
//  Coupang
//
//  Created by 권승용 on 7/7/24.
//

import SwiftUI

struct AllCategories: View {
    let products: [Product]
    let categories: [ProductCategory]
    
    var body: some View {
        Grid {
            Divider()
            ForEach(0..<categories.count/2, id: \.self) { index in
                GridRow {
                    NavigationLink {
                        ProductListContainer(
                            products: products.filter {
                                $0.categories.contains(categories[index].categoryName)
                            },
                            category: categories[index]
                        )
                    } label: {
                        AllCategoryCell(category: categories[index])
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    verticalDivider()
                    
                    NavigationLink {
                        ProductListContainer(
                            products: products.filter {
                                $0.categories.contains(categories[index].categoryName)
                            },
                            category: categories[index + categories.count/2]
                        )
                    } label: {
                        AllCategoryCell(category: categories[index + categories.count/2])
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                Divider()
            }
        }
    }
    
    @ViewBuilder
    func verticalDivider() -> some View {
        Rectangle()
            .frame(width: 1, height: 18)
            .foregroundStyle(.gray)
    }
}

#Preview {
    let model = ModelData()
    return AllCategories(products: model.products, categories: model.categories)
}
