//
//  ProductGridView.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/12/24.
//

import SwiftUI

struct ProductGridView: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            AsyncImage(url: URL(string: product.imageUrl)!){
                result in
                result.image?
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            .aspectRatio(contentMode: .fit)
            Text(product.productName)
                .font(.system(size: 18, weight: .bold))
                .lineLimit(2)
            HStack {
                Text("\(product.price)원")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.red)
                Text(product.rocketWow ? "로켓와우" : "")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.blue)
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
        }
        // 전체 컨텐츠를 왼쪽으로 정렬하고 최대 너비로 설정
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
    }
}

#Preview {
    ProductGridView(product: Product.previewData)
}
