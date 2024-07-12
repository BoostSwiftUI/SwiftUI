//
//  NumberFormatter.swift
//  Week2_Cupang
//
//  Created by MaraMincho on 7/9/24.
//

import Foundation

enum CUstomNumberFormatter {
  static let numberFormatter: NumberFormatter = .init()
  static func getDecimalPrice(_ val: Int) -> String?{
    numberFormatter.numberStyle = .decimal
    return numberFormatter.string(from: val as NSNumber)
  }
}
