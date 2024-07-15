//
//  ModelData.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import Foundation

@Observable
class ModelData {
    var foods: [Food] = JSONLoader.load("food_list_with_rank.json")
}
