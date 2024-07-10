//
//  Rating.swift
//  Coupang
//
//  Created by 권승용 on 7/8/24.
//

import SwiftUI

struct Rating: View {
    let reviewCount: Int
    let rating: Float
    
    var body: some View {
        HStack {
            ratingStars()
            Text("(\(reviewCount))")
                .foregroundStyle(.secondary)
        }
    }
    
    @ViewBuilder
    func ratingStars() -> some View {
        HStack(spacing: 0) {
            ForEach(0..<5, id: \.self) { index in
                if rating >= Float(index + 1) {
                    Image(systemName: "star.fill")
                } else if rating > Float(index) && rating < Float(index  + 1) {
                    Image(systemName: "star.fill.left")
                } else {
                    Image(systemName: "star")
                }
            }
            .font(.body)
            .foregroundStyle(.yellow)
            .minimumScaleFactor(0.7)
        }
    }
}

#Preview {
    Rating(reviewCount: Product.sample.reviewCount, rating: Product.sample.rating)
}
