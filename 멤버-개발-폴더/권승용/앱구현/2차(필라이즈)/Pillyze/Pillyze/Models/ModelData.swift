//
//  ModelData.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import Foundation

@Observable
class ModelData {
    var foods: [Food] = JSONLoader.load("food_list_with_rank.json") {
        didSet {
            foodsWithRice = foods.filter { $0.name.contains("밥") }
        }
    }
    var foodsWithRice: [Food] = []
    var isAdded: Bool = false
    var selectedFoods: [Food: Int] = [:]
}
