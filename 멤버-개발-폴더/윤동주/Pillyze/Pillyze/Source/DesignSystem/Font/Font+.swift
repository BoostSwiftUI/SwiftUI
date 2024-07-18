//
//  Font+.swift
//  Pillyze
//
//  Created by 윤동주 on 7/16/24.
//

import SwiftUI

extension Font {
    enum Pretendard {
        case bold(Size)
        case medium(Size)
        case regular(Size)
        
        enum Size: CGFloat {
            case size24 = 24
            case size20 = 20
            case size18 = 18
            case size16 = 16
            case size14 = 14
            case size12 = 12
        }
        
        var font: Font {
            switch self {
            case .bold(let size):
                return .custom("Pretendard-Bold", size: size.rawValue)
            case .medium(let size):
                return .custom("Pretendard-Medium", size: size.rawValue)
            case .regular(let size):
                return .custom("Pretendard-Regular", size: size.rawValue)
            }
        }
    }
}


