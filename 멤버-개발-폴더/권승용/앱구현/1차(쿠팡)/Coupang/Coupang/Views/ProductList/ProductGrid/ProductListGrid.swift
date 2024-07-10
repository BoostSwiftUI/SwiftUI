//
//  ProductListGrid.swift
//  Coupang
//
//  Created by 권승용 on 7/8/24.
//

import SwiftUI

struct ProductListGrid: View {
    let products: [Product]
    
    var body: some View {
        ScrollView {
            Grid(alignment: .top, horizontalSpacing: 0, verticalSpacing: 0) {
                Divider()
                ForEach(0..<products.count/2, id: \.self) { index in
                    GridRow {
                        NavigationLink {
                            ProductDetail(product: products[index])
                        } label: {
                            ProductListGridCell(product: products[index])
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        verticalDivider()
                        
                        NavigationLink {
                            ProductDetail(product: products[index + products.count/2])
                        } label: {
                            ProductListGridCell(product: products[index + products.count/2])
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    Divider()
                }
            }
        }
    }
    
    @ViewBuilder
    func verticalDivider() -> some View {
        Rectangle()
            .frame(width: 0.4)
            .frame(maxHeight: .infinity)
            .foregroundStyle(.secondary)
    }
}

#Preview {
    NavigationStack {
        ProductListGrid(products: ModelData().products)
    }
}
