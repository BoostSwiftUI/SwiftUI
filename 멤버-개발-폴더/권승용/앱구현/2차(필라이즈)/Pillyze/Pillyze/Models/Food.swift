//
//  Food.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import Foundation

struct Food: Identifiable, Codable {
    let id = UUID().uuidString
    let name: String
    let unit: String
    let caloriesPerUnit: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "foodName"
        case unit
        case caloriesPerUnit
    }
}
