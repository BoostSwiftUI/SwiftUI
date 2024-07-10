//
//  Category.swift
//  BoostCoupang
//
//  Created by 유정주 on 7/6/24.
//

import Foundation

struct Category: Codable {
    
    let name: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        
        case name = "categoryName"
        case icon = "categoryIcon"
    }
}
