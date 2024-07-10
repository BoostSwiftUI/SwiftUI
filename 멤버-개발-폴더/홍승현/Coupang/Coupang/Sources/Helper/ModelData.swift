//
//  ModelData.swift
//  Coupang
//
//  Created by 홍승현 on 7/7/24.
//

import Foundation

@Observable
final class ModelData {

  var categories: [Category] = load("categories.json")!
  var products: [Product] = load("products.json")!
}

private func load<T: Decodable>(_ fileName: String) -> T? {
  guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
  else {
    return nil
  }

  guard let data = try? Data(contentsOf: file)
  else {
    return nil
  }

  guard let decodedData = try? JSONDecoder().decode(T.self, from: data)
  else {
    return nil
  }

  return decodedData
}
