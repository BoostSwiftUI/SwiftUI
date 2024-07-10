//
//  ProductListGridRow.swift
//  Coupang
//
//  Created by 권승용 on 7/8/24.
//

import SwiftUI

struct ProductListGridCell: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            
            Text(product.name)
                .truncationMode(.middle)
                .font(.title3)
                .lineLimit(2)
            Price(discountRate: product.discountRate, price: product.price, rocketDelivery: product.rocketDelivery, rocketWow: product.rocketWow, showRocketDelivery: false)
            Rating(reviewCount: product.reviewCount, rating: product.rating)
                .font(.caption)
        }
        .padding()
    }
}

#Preview {
    ProductListGridCell(product: Product.sample)
}
