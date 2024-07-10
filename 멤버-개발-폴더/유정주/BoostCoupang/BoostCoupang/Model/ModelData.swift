//
//  ModelData.swift
//  BoostCoupang
//
//  Created by 유정주 on 7/6/24.
//

import Foundation

class ModelData {
 
    var categories: [Category] = JSONLoader.load("categories.json")
    var products: [Product] = JSONLoader.load("products.json")
}
