//
//  Food.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/15/24.
//

import Foundation

struct Food: Codable {
    
    let name: String
    let unit: String
    let caloriesPerUnit: Int
    let rank: Int
    let rankChange: Int
    
    enum CodingKeys: String, CodingKey {
        
        case name = "foodName"
        case rank = "currentRank"
        case unit, caloriesPerUnit, rankChange
    }
}
