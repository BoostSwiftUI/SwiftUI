//
//  ProductDetailView.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/13/24.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var product: Product
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: product.imageUrl)!){
                result in
                result.image?
                    .resizable()
            }
            .aspectRatio(contentMode: .fit)
            Spacer()
                .frame(height: 10)
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 0) {
                    Text("제라스전자")
                        .foregroundStyle(.blue)
                    Spacer()
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
                }
                Text(product.productName)
                    .font(.system(size: 18))
                HStack(spacing: 5) {
                    Text("\(product.discountRate)%")
                        .foregroundStyle(.black)
                    Text("\(product.price)원")
                        .strikethrough(true)
                    Button {
                        print("Info 버튼이 클릭되었습니다.")
                    } label: {
                        Image(systemName: "info.circle")
                    }
                }
                .foregroundStyle(.gray)
                Text("\(product.discountedPrice)원")
                    .font(.system(size: 25, weight: .bold))
                HStack {
                    Text(product.rocketDelivery ? "로켓배송":"")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.blue)
                    Text("내일(일) 7/28 도착 보장")
                        .foregroundStyle(.green)
                    Text("• 무료배송")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                }
                
            }
            .padding(.horizontal, 10)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}

#Preview {
    ProductDetailView(product: Product(productName: "GoPro Hero 10 Black",
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
