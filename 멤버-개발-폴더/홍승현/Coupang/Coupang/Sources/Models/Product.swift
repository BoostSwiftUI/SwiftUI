//
//  Product.swift
//  Coupang
//
//  Created by 홍승현 on 7/7/24.
//

import Foundation

struct Product: Hashable, Codable {
  let productName: String
  let categories: [String]
  let imageURL: URL
  let price: Int
  let discountRate: Int
  let rocketDelivery: Bool
  let rocketWow: Bool
  let rating: Double
  let reviewCount: Int
  let sellerName: String

  enum CodingKeys: String, CodingKey {
    case productName = "product_name"
    case categories
    case imageURL = "image_url"
    case price
    case discountRate = "discount_rate"
    case rocketDelivery = "rocket_delivery"
    case rocketWow = "rocket_wow"
    case rating
    case reviewCount = "review_count"
    case sellerName = "seller_name"
  }

}
