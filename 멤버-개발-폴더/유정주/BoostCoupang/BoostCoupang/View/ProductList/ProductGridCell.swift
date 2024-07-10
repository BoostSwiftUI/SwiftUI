//
//  ProductGridCell.swift
//  BoostCoupang
//
//  Created by 유정주 on 7/7/24.
//

import SwiftUI

struct ProductGridCell: View {
    
    let product: Product
    
    var body: some View {
        VStack(alignment: .center) {
            Image(.product)
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fill)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack(alignment: .bottom) {
                    HStack(spacing: 0) {
                        if product.discountRate == 0 {
                            Text("\(product.price)")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(.red)
                            Text("원")
                                .font(.system(size: 14, weight: .bold))
                                .bold()
                                .foregroundStyle(.red)
                            if product.isRocketWow {
                                Text("로켓 와우")
                                    .font(.system(size: 14))
                                    .bold()
                                    .foregroundStyle(.blue)
                                    .padding(.leading, 10)
                            }
                        } else {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(product.discountRate)%")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.gray)
                                    Text("\(product.price)원")
                                        .font(.system(size: 15))
                                        .strikethroughCompat()
                                        .foregroundStyle(.gray)
                                }
                                HStack(spacing: 0) {
                                    Text("\(product.discountedPrice)")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundStyle(.red)
                                    Text("원")
                                        .font(.system(size: 14, weight: .bold))
                                        .bold()
                                        .foregroundStyle(.red)
                                    if product.isRocketWow {
                                        Text("로켓 와우")
                                            .font(.system(size: 14))
                                            .bold()
                                            .foregroundStyle(.blue)
                                            .padding(.leading, 10)
                                    }
                                }
                            }
                        }
                    }
                }
                
                HStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Image(systemName: product.starSFSymbolNames[0])
                        Image(systemName: product.starSFSymbolNames[1])
                        Image(systemName: product.starSFSymbolNames[2])
                        Image(systemName: product.starSFSymbolNames[3])
                        Image(systemName: product.starSFSymbolNames[4])
                    }
                    .foregroundStyle(.yellow)
                    
                    Text("(\(product.reviewCount))")
                }
                
                if product.rewardCredits > 0 {
                    HStack {
                        Image(systemName: "c.circle.fill")
                            .foregroundStyle(.yellow)
                            .background(Color.white)
                            .clipShape(Circle())
                        Text("최대 \(product.rewardCredits)원 적립")
                            .font(.system(size: 14))
                            .bold()
                    }
                    .padding(5)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerSize: .init(width: 10, height: 10)))
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
    return ProductGridCell(product: product)
}
