//
//  WeeklyDatePicker.swift
//  PillyzeClone
//
//  Created by Mason Kim on 7/16/24.
//

import SwiftUI

struct WeeklyDatePicker: View {
    @Binding private var selectedDate: Date
    @Binding private var startDateOfCurrentWeek: Date

    @State private var currentWeekIndex: Int = 0
    @State private var contentHeight: CGFloat = 1

    private let horizontalPadding: CGFloat = 20

    private let startRangeDate: Date
    private let endRangeDate: Date
    private let weeks: [[Date]]

    init(
        selectedDate: Binding<Date>,
        startRangeDate: Date,
        endRangeDate: Date
    ) {
        self._selectedDate = selectedDate
        self._startDateOfCurrentWeek = .constant(selectedDate.wrappedValue.startOfWeek())
        self.startRangeDate = startRangeDate.startOfDay
        self.endRangeDate = endRangeDate.startOfDay
        self.weeks = Self.calculateWeeks(from: startRangeDate, to: endRangeDate)
    }

    var body: some View {
        TabView(selection: $currentWeekIndex) {
            ForEach(weeks.indices, id: \.self) { index in
                let weekDays = weeks[index]
                weekView(weekDays)
                    .tag(index)
            }
            .getSize { size in
                guard size.height != contentHeight else { return }
                contentHeight = size.height
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: contentHeight)
        .onChange(of: weeks, initial: true) { _, _ in
            updateWeekIndex()
        }
        .onChange(of: selectedDate) { _, _ in
            updateWeekIndex()
        }
        .onChange(of: currentWeekIndex) { _, newValue in
            guard let startDate = weeks[newValue].first else { return }
            startDateOfCurrentWeek = startDate
        }
    }
}

// MARK: - Inner Views

private extension WeeklyDatePicker {
    func weekView(_ dates: [Date]) -> some View {
        HStack(spacing: 0) {
            ForEach(dates, id: \.self) { date in
                dateCell(date)
            }
        }
        .padding(.horizontal, horizontalPadding)
    }

    func dateCell(_ date: Date) -> some View {
        let isSelectedDate = date.isSameDay(as: selectedDate)
        let isSelectableDate = startRangeDate.startOfDay <= date.startOfDay && date.startOfDay <= endRangeDate.startOfDay

        return VStack(spacing: 12) {
            Text(date.formattedString(by: .ee))
                .foregroundStyle(isSelectedDate ? .primaryNormal : .primaryDisabled)
                .frame(width: 24, height: 24)
                .background {
                    Group {
                        if date.isToday {
                            Circle()
                                .fill(.gray)
                        }

                        if isSelectedDate {
                            Circle()
                                .fill(.white)
                        }
                    }
                    .frame(width: 24, height: 24)
                }

            Text(date.formattedString(by: .dd))
                .foregroundStyle(isSelectableDate ? .white : .gray)
                .onTapGesture {
                    selectedDate = date
                }
                .disabled(!isSelectableDate)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Inner Functions

private extension WeeklyDatePicker {
    static func calculateWeeks(from startDate: Date, to endDate: Date) -> [[Date]] {
        let startWeekDate = startDate.startOfWeek()
        let endWeekDate = endDate.startOfWeek()
        let weekInterval = Date.timeIntervalInOneDay * 7

        return stride(
            from: startWeekDate,
            to: endWeekDate.afterDate(dayAfter: 7),
            by: weekInterval
        )
        .map { date -> [Date] in
            date.weekDays()
        }
    }

    func updateWeekIndex() {
        guard let newWeekIndex = weeks.firstIndex(where: { weekDays in
            weekDays.contains { date in date.isSameDay(as: selectedDate) }
        }) else { return }
        currentWeekIndex = newWeekIndex
    }
}

// MARK: - Modifiers

extension WeeklyDatePicker {
    func startDateOfCurrentWeek(_ date: Binding<Date>) -> Self {
        var picker = self
        picker._startDateOfCurrentWeek = date
        return picker
    }
}

// MARK: - Preview

#Preview {
    struct SampleView: View {
        @State private var selectedDate = Date()

        var body: some View {
            VStack {
                WeeklyDatePicker(
                    selectedDate: $selectedDate,
                    startRangeDate: Date().beforeDate(dayBefore: 100),
                    endRangeDate: Date()
                )
            }
            .frame(maxHeight: .infinity)
            .background(.gray.opacity(0.2))
            .onChange(of: selectedDate) { oldValue, newValue in
                print(newValue)
            }
        }
    }

    return SampleView()
}
