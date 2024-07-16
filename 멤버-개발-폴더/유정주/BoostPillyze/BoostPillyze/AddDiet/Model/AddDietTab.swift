//
//  AddDietTab.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/16/24.
//

import Foundation

enum AddDietTab {
    
    case most
    case favorites
    case custom
    
    var title: String {
        switch self {
        case .most:
            "자주 드셨어요"
        case .favorites:
            "즐겨찾기"
        case .custom:
            "직접 등록"
        }
    }
}
