//
//  Date+Extensions.swift
//  PillyzeClone
//
//  Created by Mason Kim on 7/16/24.
//

import Foundation

extension Date {
    static let timeIntervalInOneDay: TimeInterval = 60 * 60 * 24

    static func fromComponents(
        year: Int,
        month: Int,
        day: Int = 1,
        hour: Int = 0,
        minute: Int = 0,
        second: Int = 0
    ) -> Date {
        var components = DateComponents()
        components.calendar = .currentTimeZone
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second

        return Calendar.currentTimeZone.date(from: components)!
    }

    func afterDate(
        yearAfter: Int = 0,
        monthAfter: Int = 0,
        dayAfter: Int = 0,
        hourAfter: Int = 0,
        minuteAfter: Int = 0
    ) -> Date {
        let calendar = Calendar.currentTimeZone
        var afterDate: Date = calendar.date(byAdding: .year, value: yearAfter, to: self) ?? Date()
        afterDate = calendar.date(byAdding: .month, value: monthAfter, to: afterDate) ?? Date()
        afterDate = calendar.date(byAdding: .day, value: dayAfter, to: afterDate) ?? Date()
        afterDate = calendar.date(byAdding: .hour, value: hourAfter, to: afterDate) ?? Date()
        afterDate = calendar.date(byAdding: .minute, value: minuteAfter, to: afterDate) ?? Date()
        return afterDate
    }

    func beforeDate(
        yearBefore: Int = 0,
        monthBefore: Int = 0,
        dayBefore: Int = 0,
        hourBefore: Int = 0,
        minuteBefore: Int = 0
    ) -> Date {
        let calendar = Calendar.currentTimeZone
        var agoDate: Date = calendar.date(byAdding: .year, value: -yearBefore, to: self) ?? Date()
        agoDate = calendar.date(byAdding: .month, value: -monthBefore, to: agoDate) ?? Date()
        agoDate = calendar.date(byAdding: .day, value: -dayBefore, to: agoDate) ?? Date()
        agoDate = calendar.date(byAdding: .hour, value: -hourBefore, to: agoDate) ?? Date()
        agoDate = calendar.date(byAdding: .minute, value: -minuteBefore, to: agoDate) ?? Date()
        return agoDate
    }

    static func lastDayOfMonth(year: Int, month: Int) -> Int {
        var components = DateComponents()
        components.setValue(year, for: .year)
        components.setValue(month + 1, for: .month)
        components.setValue(0, for: .day)
        let date = Calendar.currentTimeZone.date(from: components)
        return date?.components.day ?? 0
    }

    var year: Int {
        components.year ?? 0
    }

    var month: Int {
        components.month ?? 0
    }

    var day: Int {
        components.day ?? 0
    }

    var isToday: Bool {
        Calendar.currentTimeZone.isDateInToday(self)
    }

    var isYesterday: Bool {
        Calendar.currentTimeZone.isDateInYesterday(self)
    }

    var isTomorrow: Bool {
        Calendar.currentTimeZone.isDateInTomorrow(self)
    }

    var yesterday: Date {
        Calendar.currentTimeZone.date(byAdding: .day, value: -1, to: self) ?? Date()
    }

    var isLastDayOfYear: Bool {
        month == 12 && day == 31
    }

    var hour: Int {
        components.hour ?? 0
    }

    var minute: Int {
        components.minute ?? 0
    }

    var second: Int {
        components.second ?? 0
    }

    var min: Date {
        copyWith(hour: 0, minute: 0, second: 0)
    }

    var max: Date {
        copyWith(hour: 23, minute: 59, second: 59)
    }

    /// 오늘의 시작 순간 (00:00:00)
    var startOfDay: Date {
        Calendar.currentTimeZone.startOfDay(for: self)
    }

    /// 오늘의 가장 마지막 순간 (23:59:59.999)
    var endOfTheDay: Date {
        startOfDay
            .afterDate(dayAfter: 1)
            .addingTimeInterval(-0.001)
    }

    /// 해당 시간의 가장 마지막 순간 ({hh}:59:59)
    var endOfTheHour: Date {
        self
            .afterDate(hourAfter: 1)
            .addingTimeInterval(-0.01)
    }

    var thisMonday: Date {
        var calendar = Calendar.currentTimeZone
        calendar.firstWeekday = 2
        let dateComponents = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        return calendar.date(from: dateComponents) ?? Date()
    }

    func lastDayOfMonth() -> Int {
        var components = DateComponents()
        components.setValue(year, for: .year)
        components.setValue(month + 1, for: .month)
        components.setValue(0, for: .day)
        let date = Calendar.currentTimeZone.date(from: components)!
        return date.components.day!
    }

    func copyWith(
        year: Int? = nil,
        month: Int? = nil,
        day: Int? = nil,
        hour: Int? = nil,
        minute: Int? = nil,
        second: Int? = nil
    ) -> Date {
        Date.fromComponents(
            year: year ?? components.year!,
            month: month ?? components.month!,
            day: day ?? components.day!,
            hour: hour ?? components.hour!,
            minute: minute ?? components.minute!,
            second: second ?? components.second!
        )
    }

    func isSameDay(as date: Date) -> Bool {
        return (year == date.year) && (month == date.month) && (day == date.day)
    }

    func dayDifferenceSince(_ date: Date) -> TimeInterval {
        min.timeIntervalSince(date.min)
    }

    /// 특정 날짜가 날짜들 안에서 년도가 바뀌는 날짜인지 확인
    /// - Parameter dates: 년도가 바뀌는지를 확인할 날짜들
    /// - Returns: 년도가 바뀌었는지 여부
    func isYearChangedDate(in dates: [Date]) -> Bool {
        let date = self
        guard let index = dates.firstIndex(of: date),
              let beforeYear = dates[safe: index - 1]?.year else {
            return false
        }
        let currentYear = date.year
        return currentYear != beforeYear
    }

    func weekDays() -> [Date] {
        let calendar = Calendar.mondayCalendar
        let startOfWeek = self.startOfWeek()
        return (0..<7).compactMap { index in
            guard let weekDay = calendar.date(byAdding: .day, value: index, to: startOfWeek) else { return nil }
            return weekDay
        }
    }

    func startOfWeek(using calendar: Calendar = .mondayCalendar) -> Date {
        calendar.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: self).date ?? Date()
    }

    var weekInterval: DateInterval? {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)

        guard let startDate = calendar.date(from: dateComponents),
              let endDate = calendar.date(byAdding: .day, value: 6, to: startDate) else {
            return nil
        }
        return DateInterval(start: startDate, end: endDate)
    }
}

fileprivate extension Date {
    var components: DateComponents {
        Calendar.currentTimeZone.dateComponents(
            [.year, .month, .day, .hour, .minute, .second],
            from: self
        )
    }
}

extension Calendar {
    static let mondayCalendar: Calendar = {
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 2
        calendar.timeZone = TimeZone.current
        return calendar
    }()

    static let currentTimeZone: Calendar = {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        return calendar
    }()
}
