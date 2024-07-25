//
//  DateFormat.swift
//  PillyzeClone
//
//  Created by Mason Kim on 7/16/24.
//

import Foundation

enum DateFormat: String {
    /// 년.월.일
    case yyyyMMdd = "yyyy.MM.dd"

    /// 한국어 년월일 (yyyy년 MM월 dd일)
    case yyyyMMddKorean = "yyyy년 MM월 dd일"

    /// 한국어 월일 (MM월 dd일)
    case MMddKorean = "MM월 dd일"

    /// 한국어 월일 (요일) (MM월 dd일 (월))
    case MMddEEKorean = "MM월 dd일(EE)"

    /// 한국어 월일 (M월 dd일)
    case MddKorean = "M월 dd일"

    /// 한국어 월 일 시간 (1월 30일 오전 05:28)
    case MdahhmmKorean = "M월 d일 a hh:mm"

    /// 한국어 월 일 요일 시간 (1월 30일 (월) 오전 05:28)
    case MdEEahhmmKorean = "M월 d일(EE) a hh:mm"

    /// 년.월
    case yyyyMM = "yyyy.MM"

    /// 월.일
    case MMdd = "MM.dd"

    /// 년
    case yyyy = "yyyy"

    /// 한국어 연도 (2024년))
    case yyyyKorean = "yyyy년"

    /// 월
    case MM = "MM"

    /// 한국어 월 (05월)
    case MMKorean = "MM월"

    /// 일
    case dd = "dd"

    /// 한국어 일 요일 (9일(목))
    case ddeeKorean = "dd일(EE)"

    /// 년.월.일 시:분:초
    case dateTime = "yyyy.MM.dd HH:mm:ss"

    /// 년.월.일 시:분
    case yyyyMMddHHmm = "yyyy.MM.dd HH:mm"

    /// 년.월.일 오전/오후 시:분
    case yyyyMMddahhmm = "yyyy.MM.dd a hh:mm"

    /// 년.월.일 오전/오후 시(24):분
    case yyyyMMddaHHmm = "yyyy.MM.dd a HH:mm"

    /// 시:분:초
    case HHmmss = "HH:mm:ss"

    /// 시:분
    case HHmm = "HH:mm"

    /// 오전/오후 시:분
    case ahhmm = "a hh:mm"

    /// 축약 요일 (월, 화)
    case ee = "EE"

    /// 년-월-일 (서버 날짜)
    case yyyyMMddServerDate = "yyyy-MM-dd"

    /// 년-월-일 시:분:초.소수점초 (서버 날짜, 시간)
    case yyyyMMddTHHmmssServerDateTime = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
}

// MARK: - DateFormatter

extension DateFormat {
    private static var cachedFormatters: NSCache<NSString, DateFormatter> = .init()

    // MARK: - Public

    /// 각 DateFormat에 따른 formatter
    ///
    /// - 미리 생성해둔 인스턴스를 재사용함
    /// - `DateFormatter` 의 생성 비용은 굉장히 비싸서 재사용 하는 것이 효율적
    /// - `DateFormatter`는 thread-safe 하기에 전역적으로 사용 가능
    var formatter: DateFormatter {
        Self.cachedFormatter(ofDateFormat: rawValue)
    }

    static func cachedFormatter(ofDateFormat dateFormat: String) -> DateFormatter {
        let dateFormatKey = NSString(string: dateFormat)
        if let cachedFormatter = cachedFormatters.object(forKey: dateFormatKey) {
            return cachedFormatter
        }

        let formatter = makeFormatter(withDateFormat: dateFormat)
        cachedFormatters.setObject(formatter, forKey: dateFormatKey)
        return formatter
    }

    // MARK: - Private Methods

    private static func makeFormatter(withDateFormat dateFormat: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }
}
