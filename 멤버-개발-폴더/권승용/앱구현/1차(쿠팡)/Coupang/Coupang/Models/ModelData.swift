//
//  ModelData.swift
//  Coupang
//
//  Created by 권승용 on 7/7/24.
//

import Foundation

@Observable
class ModelData {
    var products: [Product] = JSONLoader.load("products.json")
    var categories: [ProductCategory] = JSONLoader.load("categories.json")
}
