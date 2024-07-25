//
//  Date+Format.swift
//  PillyzeClone
//
//  Created by Mason Kim on 7/16/24.
//

import Foundation

extension String {
    func date(fromFormat format: DateFormat) -> Date {
        format.formatter.date(from: self) ?? Date()
    }
}

extension Date {
    func formattedString(by dateFormat: DateFormat) -> String {
        return dateFormat.formatter.string(from: self)
    }

    /// 특정 `DateFormat`에 해당하지 않는 경우, 캐싱 처리
    func formattedString(format: String) -> String {
        let formatter = DateFormat.cachedFormatter(ofDateFormat: format)
        return formatter.string(from: self)
    }
}
