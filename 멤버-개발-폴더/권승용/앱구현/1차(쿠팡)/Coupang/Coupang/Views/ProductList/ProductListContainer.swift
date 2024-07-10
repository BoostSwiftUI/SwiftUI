//
//  ProductList.swift
//  Coupang
//
//  Created by 권승용 on 7/9/24.
//

import SwiftUI

struct ProductListContainer: View {
    @State private var isShowingGrid = false
    let products: [Product]
    let category: ProductCategory
    
    var body: some View {
        ZStack {
            if isShowingGrid {
                ProductListGrid(products: products)
            } else {
                ProductList(products: products)
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        isShowingGrid.toggle()
                    } label: {
                        Circle()
                            .frame(width: 55, height: 55)
                            .overlay {
                                Image(systemName: "arrowshape.left.arrowshape.right.fill")
                                    .foregroundStyle(.white)
                            }
                    }
                    Spacer()
                        .frame(width: 16)
                }
                Spacer()
                    .frame(height: 32)
            }
        }
        .navigationTitle(category.categoryName)
    }
}

#Preview {
    ProductListContainer(products: ModelData().products, category: ProductCategory.sample)
}
