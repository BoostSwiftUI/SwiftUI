//
//  ProductCategory.swift
//  Coupang
//
//  Created by 권승용 on 7/7/24.
//

import Foundation

struct ProductCategory: Codable {
    let categoryName: String
    let categoryIcon: String
    
    static let sample = ProductCategory(
        categoryName: "카테고리 이름",
        categoryIcon: "😂"
    )
}
