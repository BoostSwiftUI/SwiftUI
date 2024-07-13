//
//  Product.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/8/24.
//

import Foundation

struct Product: Hashable, Codable {
    let id = UUID()
    let productName: String
    let categories: [String]
    let imageUrl: String
    let price: Int
    let discountRate: Int
    let rocketDelivery: Bool
    let rocketWow: Bool
    let rating: Double
    let reviewCount: Int
    let sellerName: String
    
    var discountedPrice: Int {
        price * (100-(discountRate)) / 100
    }
    
    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case categories
        case imageUrl = "image_url"
        case price
        case discountRate = "discount_rate"
        case rocketDelivery = "rocket_delivery"
        case rocketWow = "rocket_wow"
        case rating
        case reviewCount = "review_count"
        case sellerName = "seller_name"
    }
}
