//
//  Food.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import Foundation

struct Food: Hashable, Identifiable, Codable {
    let id = UUID().uuidString
    let name: String
    let unit: String
    let caloriesPerUnit: Int
    let currentRank: Int
    let rankChange: Int
    let carbohydrates: Double
    let protein: Double
    let fat: Double
    
    enum CodingKeys: String, CodingKey {
        case name = "foodName"
        case unit
        case caloriesPerUnit
        case currentRank
        case rankChange
        case carbohydrates
        case protein
        case fat
    }
    
    enum RankChangeStatus {
        case down
        case up
        case maintain
    }
    
    var rankChangeStatus: RankChangeStatus {
        if rankChange < 0 {
            return .down
        } else if rankChange > 0 {
            return .up
        } else {
            return .maintain
        }
    }
}
