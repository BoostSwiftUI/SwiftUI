//
//  Food.swift
//  Pillyze
//
//  Created by 이준복 on 7/15/24.
//

import Foundation

struct Food: Identifiable, Codable {
    
    let id = UUID()
    let name: String
    let unit: String
    let caloriesPerUnit: Int
    let currentRank: Int
    let rankChange: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "foodName"
        case unit, caloriesPerUnit, currentRank, rankChange
    }
}
