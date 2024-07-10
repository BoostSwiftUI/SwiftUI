//
//  Product.swift
//  BoostCoupang
//
//  Created by 유정주 on 7/7/24.
//

import Foundation

struct Product: Codable, Identifiable {
    
    let id = UUID()
    let name: String
    let categories: [String]
    let imageURL: String
    let price: Int
    let discountRate: Int
    let isRocketDelivery: Bool
    let isRocketWow: Bool
    let rating: Double
    let reviewCount: Int
    let sellerName: String
    
    var starSFSymbolNames: [String] {
        var names: [String] = []
        let roundedValue = (rating * 2).rounded() / 2
        let fullStars = Int(roundedValue)
        let isHalf = roundedValue - Double(fullStars) == 0.5
        let emptyStars = 5 - fullStars - (isHalf ? 1 : 0)
        
        names += Array(repeating: "star.fill", count: fullStars)
        if isHalf {
            names += ["star.leadinghalf.filled"]
        }
        names += Array(repeating: "star.fill", count: emptyStars)
        return names
    }
    
    var discountedPrice: Int {
        guard discountRate > 0 else {
            return price
        }
        let discountAmount = Double(price) * (Double(discountRate) / 100.0)
        return price - Int(discountAmount)
    }
    
    var rewardCredits: Int {
        Int(Double(discountedPrice) * 0.01)
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "product_name"
        case categories
        case imageURL = "image_url"
        case price
        case discountRate = "discount_rate"
        case isRocketDelivery = "rocket_delivery"
        case isRocketWow = "rocket_wow"
        case rating
        case reviewCount = "review_count"
        case sellerName = "seller_name"
    }
}
