//
//  ProductDetail.swift
//  Coupang
//
//  Created by 권승용 on 7/9/24.
//

import SwiftUI

struct ProductDetail: View {
    let product: Product
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: product.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity)
            
            VStack(spacing: 8) {
                HStack {
                    Text(product.sellerName)
                        .foregroundStyle(.tint)
                    Spacer()
                    Rating(reviewCount: product.reviewCount, rating: product.rating)
                }
                
                HStack {
                    Text(product.name)
                        .font(.largeTitle)
                    Spacer()
                }
                
                HStack {
                    Text("\(product.price)원")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                    Spacer()
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("")
    }
}

#Preview {
    ProductDetail(product: Product.sample)
}
