//
//  ProductDetail.swift
//  BoostCoupang
//
//  Created by 유정주 on 7/7/24.
//

import SwiftUI

struct ProductDetail: View {
    
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(.product)
                    .resizable()
                    .frame(minHeight: 0, maxHeight: 300)
                    .aspectRatio(1, contentMode: .fill)
                
                HStack {
                    Text(product.sellerName)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.blue)
                    
                    Spacer()
                    
                    HStack(alignment: .bottom, spacing: 0) {
                        HStack(spacing: 0) {
                            Image(systemName: product.starSFSymbolNames[0])
                            Image(systemName: product.starSFSymbolNames[1])
                            Image(systemName: product.starSFSymbolNames[2])
                            Image(systemName: product.starSFSymbolNames[3])
                            Image(systemName: product.starSFSymbolNames[4])
                        }
                        .foregroundStyle(.yellow)
                        
                        Text("(\(product.reviewCount))")
                            .font(.system(size: 14))
                            .foregroundStyle(.blue)
                    }
                }
                
                Text(product.name)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

                Text("\(product.price)원")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.red)
                
                Divider()
                
                if product.isRocketWow {
                    HStack {
                        Text("🚀 로켓 와우")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                        Text("무료체험")
                            .font(.system(size: 18))
                            .foregroundStyle(.blue)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    let product = Product(
        name: "Apple 에어팟 프로",
        categories: ["Technology"],
        imageURL: "https://loremflickr.com/300/300/Technology",
        price: 329000,
        discountRate: 29,
        isRocketDelivery: true,
        isRocketWow: true,
        rating: 4.8,
        reviewCount: 68403,
        sellerName: "애플"
    )
    return ProductDetail(product: product)
}
