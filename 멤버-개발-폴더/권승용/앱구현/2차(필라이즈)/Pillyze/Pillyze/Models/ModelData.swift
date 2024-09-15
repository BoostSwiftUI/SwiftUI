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
    
    var totalCalory: Int {
        selectedFoods.reduce(0) { partialResult, food in
            return partialResult + food.key.caloriesPerUnit
        }
    }
    
    private var totalNutritionWeight: Double {
        selectedFoods.reduce(0) { partialResult, food in
            return partialResult + food.key.carbohydrates + food.key.protein + food.key.fat
        }
    }
    
    var totalCarbohydrateText: String {
        let total = totalCarbohydrates
        let result = total == floor(total) ? String(format: "%d", Int(total)) : String(format: "%.1f", total)
        return result
    }
    
    var totalProteinText: String {
        let total = totalProtein
        let result = total == floor(total) ? String(format: "%d", Int(total)) : String(format: "%.1f", total)
        return result
    }
    
    var totalFatText: String {
        let total = totalFat
        let result = total == floor(total) ? String(format: "%d", Int(total)) : String(format: "%.1f", total)
        return result
    }
    
    var carbohydrateDecimal: Double {
        guard totalNutritionWeight != 0 else {
            return 0
        }
        let decimal = totalCarbohydrates / totalNutritionWeight
        return Double(decimal)
    }
    
    var proteinDecimal: Double {
        guard totalNutritionWeight != 0 else {
            return 0
        }
        let decimal = totalProtein / totalNutritionWeight
        return Double(decimal)
    }
    
    var fatDecimal: Double {
        guard totalNutritionWeight != 0 else {
            return 0
        }
        let decimal = totalFat / totalNutritionWeight
        return Double(decimal)
    }
    
    var carbohydratePercentage: Int {
        Int(carbohydrateDecimal * 100)
    }
    
    var proteinPercentage: Int {
        Int(proteinDecimal * 100)
    }
    
    var fatPercentage: Int {
        let fatPercentage = Int(fatDecimal * 100)
        let difference = (carbohydratePercentage + proteinPercentage + fatPercentage) - 100
        return fatPercentage - difference
    }
    
    private var totalCarbohydrates: Double {
        selectedFoods.reduce(0) { partialResult, food in
            return partialResult + food.key.carbohydrates
        }
    }
    
    private var totalProtein: Double {
        selectedFoods.reduce(0) { partialResult, food in
            return partialResult + food.key.protein
        }
    }
    
    private var totalFat: Double {
        selectedFoods.reduce(0) { partialResult, food in
            return partialResult + food.key.fat
        }
    }
}
