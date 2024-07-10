//
//  ProductList.swift
//  Coupang
//
//  Created by 권승용 on 7/8/24.
//

import SwiftUI

struct ProductList: View {
    let products: [Product]
    
    var body: some View {
        ScrollView {
            Divider()
            ForEach(products, id: \.self) { product in
                NavigationLink {
                    ProductDetail(product: product)
                } label: {
                    ProductListRow(product: product)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                }
                .buttonStyle(PlainButtonStyle())
                Divider()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProductList(products: ModelData().products)
    }
}
