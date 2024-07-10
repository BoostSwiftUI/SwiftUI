//
//  ProductListCell.swift
//  BoostCoupang
//
//  Created by 유정주 on 7/7/24.
//

import SwiftUI

struct ProductListCell: View {
    
    let product: Product
    
    var body: some View {
        HStack(alignment: .top) {
            Image(.product)
                .resizable()
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    HStack(spacing: 0) {
                        Text("\(product.price)")
                            .font(.system(size: 18, weight: .bold))
                            .bold()
                            .foregroundStyle(.red)
                        Text("원")
                            .font(.system(size: 14, weight: .bold))
                            .bold()
                            .foregroundStyle(.red)
                    }
                    if product.isRocketDelivery {
                        Text("로켓 배송")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundStyle(.blue)
                    }
                }
                
                if product.isRocketWow {
                    Text("무조건 내일 배송")
                        .font(.system(size: 14))
                        .bold()
                        .foregroundStyle(.green)
                    Text("로켓 와우")
                        .font(.system(size: 14))
                        .bold()
                        .foregroundStyle(.indigo)
                }
                
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
                        .foregroundStyle(.gray)
                }
            }
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
    return ProductListCell(product: product)
}
