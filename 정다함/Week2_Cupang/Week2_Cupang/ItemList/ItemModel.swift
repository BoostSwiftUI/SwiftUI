//
//  ItemModel.swift
//  Week2_Cupang
//
//  Created by MaraMincho on 7/9/24.
//

import Foundation
// MARK: - ItemModelElement
struct ItemModelElement: Codable {
  let productName: String
  let categories: [String]
  let imageURL: String
  let price, discountRate: Int
  let rocketDelivery, rocketWow: Bool
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

extension ItemModelElement {
  var currentCurrencyText: String{
    "원"
  }
  var discountRateText: String {
    discountRate.description + "%"
  }
  var originalPriceText: String {
    CUstomNumberFormatter.getDecimalPrice(price) ?? "" + currentCurrencyText
  }
  var discountPriceText: String {
    let price = Int(Double(price) * Double(100 / discountRate))
    return CUstomNumberFormatter.getDecimalPrice(price) ?? "0" + currentCurrencyText
  }
  
  var reviewCountText: String {
    "(" + (CUstomNumberFormatter.getDecimalPrice(reviewCount) ?? "0") + ")"
  }
  var starRatingWeight: Double {
    (rating * 2).rounded() / 2
  }
}
