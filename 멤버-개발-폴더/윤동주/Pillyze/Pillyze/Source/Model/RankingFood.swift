//
//  RankingFood.swift
//  Pillyze
//
//  Created by 윤동주 on 7/25/24.
//

import Foundation

struct RankingFood: Hashable, Codable {
    let id = UUID()
    let name: String
    let unit: String
    let calory: Int
    let rank: Int
    let rankChange: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "foodName"
        case unit = "unit"
        case calory = "caloriesPerUnit"
        case rank = "currentRank"
        case rankChange = "rankChange"
    }
    
    static let previewData: RankingFood = RankingFood(name: "고추장찌개",
                                                      unit: "1인분(300g)",
                                                      calory: 210,
                                                      rank: 29,
                                                      rankChange: -3)
}
