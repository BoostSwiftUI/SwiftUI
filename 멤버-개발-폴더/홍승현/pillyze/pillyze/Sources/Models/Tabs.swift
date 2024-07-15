//
//  Tabs.swift
//  pillyze
//
//  Created by 홍승현 on 7/15/24.
//

import SwiftUI

enum Tabs: String, Hashable, CaseIterable {
  case myHealth = "내 건강"
  case nutrients = "영양제"

  var image: Image {
    switch self {
    case .myHealth:
        .init(.myHealth)
    case .nutrients:
        .init(.nutrients)
    }
  }
  
  var index: Int {
    Tabs.allCases.firstIndex(of: self) ?? 0
  }
}
