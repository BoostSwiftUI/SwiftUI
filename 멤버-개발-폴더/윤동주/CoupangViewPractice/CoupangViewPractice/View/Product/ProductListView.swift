//
//  ProductListView.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/13/24.
//

import SwiftUI

struct ProductListView: View {
    var product: Product
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: product.imageUrl)!){
                result in
                result.image?
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading, spacing: 8) {
                Text(product.productName)
                    .lineLimit(2)
                HStack {
                    Text("\(product.discountRate)%")
                    Text("\(product.price)원")
                        .strikethrough(true) // 텍스트 가운데에 줄을 긋는 modifier
                }
                .foregroundStyle(.gray)
                HStack {
                    Text("\(product.discountedPrice)원")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.red)
                    Text(product.rocketDelivery ? "로켓배송":"")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.blue)
                }
                Text("내일(수) 7/28 도착 보장")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.green)
                HStack {
                    Text(product.rocketWow ? "로켓와우":"")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.blue)
                    Text("내일(수) 새벽 도착 보장")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.green)
                }
                HStack(spacing: 0) {
                    Group{
                        let filled = Int(product.rating)
                        let half_filled = Int(round(product.rating)) - filled
                        ForEach(0..<filled, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                        }
                        ForEach(0..<half_filled, id: \.self) { _ in
                            Image(systemName: "star.leadinghalf.filled")
                                .foregroundStyle(.yellow)
                        }
                        ForEach(0..<5-filled-half_filled, id: \.self) { _ in
                            Image(systemName: "star")
                                .foregroundStyle(.gray)
                        }
                    }
                    Text("(\(product.reviewCount))")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.gray)
                }
                Text("\(Int(Double(product.price) * 0.01))원 적립")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 2)
                    .background(Color(hex: "#EFF4F5"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}

#Preview {
    ProductListView(product: Product(productName: "GoPro Hero 10 Black",
                                     categories: ["Technology", "Sports"],
                                     imageUrl: "https://loremflickr.com/300/300/Technology",
                                     price: 599000,
                                     discountRate: 15,
                                     rocketDelivery: true,
                                     rocketWow: true,
                                     rating: 4.7,
                                     reviewCount: 610,
                                     sellerName: "GoPro Official Store"))
}
