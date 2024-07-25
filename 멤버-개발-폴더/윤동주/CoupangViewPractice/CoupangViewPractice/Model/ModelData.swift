//
//  ModelData.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/8/24.
//

import Foundation

@Observable
class ModelData {
    var categories: [Category] = load("categories.json")
    var products: [Product] = load("products.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)))")
    }
}
