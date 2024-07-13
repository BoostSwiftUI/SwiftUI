//
//  Category.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/8/24.
//

import Foundation

struct Category: Hashable, Codable {
    let id = UUID()
    let name: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case name = "categoryName"
        case icon = "categoryIcon"
    }
}
