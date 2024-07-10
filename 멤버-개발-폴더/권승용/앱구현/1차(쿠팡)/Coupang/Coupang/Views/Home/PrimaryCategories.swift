//
//  PrimaryCategories.swift
//  Coupang
//
//  Created by 권승용 on 7/6/24.
//

import SwiftUI

struct PrimaryCategories: View {
    let products: [Product]
    
    var body: some View {
        HStack() {
            NavigationLink {
                ProductListContainer(
                    products: products.sorted(by: { $0.discountRate > $1.discountRate }),
                    category: ProductCategory(categoryName: "최고할인", categoryIcon: "")
                )
            } label: {
                PrimaryCategoryCell(symbolName: "arrowshape.down.fill", categoryName: "최고할인")
            }

            NavigationLink {
                ProductListContainer(
                    products: products.filter { $0.rocketDelivery },
                    category: ProductCategory(categoryName: "로켓배송", categoryIcon: "")
                )
            } label: {
                PrimaryCategoryCell(symbolName: "tray.fill", categoryName: "로켓배송")
            }
        }
        .buttonStyle(PlainButtonStyle())
        
    }
}

#Preview {
    NavigationStack {
        PrimaryCategories(products: ModelData().products)
    }
}
