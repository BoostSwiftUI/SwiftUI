//
//  Product.swift
//  Coupang
//
//  Created by 권승용 on 7/7/24.
//

import Foundation

struct Product: Hashable, Codable {
    let name: String
    let sellerName: String
    let categories: [String]
    let imageURL: String
    let price: Int
    let discountRate: Int
    let rocketDelivery: Bool
    let rocketWow: Bool
    let rating: Float
    let reviewCount: Int
    var reward: Int {
        let reward = Double(price) * 0.01
        return Int(reward)
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "product_name"
        case sellerName = "seller_name"
        case categories = "categories"
        case imageURL = "image_url"
        case price
        case discountRate = "discount_rate"
        case rocketDelivery = "rocket_delivery"
        case rocketWow = "rocket_wow"
        case rating
        case reviewCount = "review_count"
    }
    
    static let sample = Product(
        name: "상품이름",
        sellerName: "판매자이름",
        categories: ["카테고리이름1", "카테고리이름2"],
        imageURL: "https://loremflickr.com/300/300/Technology",
        price: 10000,
        discountRate: 10,
        rocketDelivery: true,
        rocketWow: true,
        rating: 4.5,
        reviewCount: 1000
    )
}
