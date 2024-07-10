//
//  ProductListRow.swift
//  Coupang
//
//  Created by 권승용 on 7/8/24.
//

import SwiftUI

struct ProductListRow: View {
    let product: Product
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: product.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 120)
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.body)
                    .padding(.bottom, 4)
                Price(discountRate: product.discountRate, price: product.price, rocketDelivery: product.rocketDelivery, rocketWow: product.rocketWow)
                Rating(reviewCount: product.reviewCount, rating: product.rating)
                Reward(reward: product.reward)
            }
            Spacer()
        }
    }
}

#Preview {
    ProductListRow(product: Product.sample)
}
