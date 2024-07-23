//
//  Font+Extension.swift
//  PillyzeClone
//
//  Created by Mason Kim on 7/16/24.
//

import SwiftUI

extension Font {
    static func pretendard(_ type: Pretendard, size: CGFloat) -> Font {
        return .custom(type.rawValue, size: size)
    }
}
