//
//  HCalendarView.swift
//  Pillyze
//
//  Created by MaraMincho on 7/28/24.
//

import ComposableArchitecture
import SwiftUI

// MARK: - HCalendarView

struct HCalendarView: View {

  @Bindable
  var store: StoreOf<HCalendarReducer>

  @State var pageSize: CGSize = .init(width: 0, height: 0)

  var body: some View {
    dayPageView
      .getSize { size in
        pageSize = size
      }
      .frame(maxHeight: 85)
      .onAppear {
        store.send(.onAppeared)
      }
  }

  // MARK: - 일자 표시 뷰

  @ViewBuilder
  private var dayPageView: some View {
    ScrollViewReader { proxy in
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack(spacing: 0) {
          let dates = store.front + [store.current] + store.back
          ForEach(dates, id: \.self) { val in
            makePageView(val)
              .frame(width: pageSize.width)
          }
        }
        .scrollTargetLayout()
      }
      .scrollTargetBehavior(.paging)
      .onAppear {
        proxy.scrollTo(store.current)
      }
    }
  }

  @ViewBuilder
  private func makePageView(_ date: [Date]) -> some View {
    HStack(spacing: 0) {
      ForEach(date, id: \.self) { date in
        let isSelected = store.selectedDate == date

        VStack(spacing: 12) {
          ZStack {
            Circle()
              .foregroundStyle(isSelected ? Color.white : Color.clear)
              .frame(width: 24, height: 24)

            Text(day(from: date))
              .applyFont(.medium, size: ._12)
              .foregroundStyle(isSelected ? Color.primaryFL : Color.primaryDisabled)
          }

          Text("\(store.calendar.component(.day, from: date))")
            .applyFont(.bold, size: ._24)
            .foregroundStyle(Color.white)
        }
        .padding(.top, 4)
        .padding(.bottom, 16)
        .frame(width: 49, height: 80)
        .contentShape(Rectangle())
        .onTapGesture {
          store.send(.tappedDate(date))
        }
      }
    }
  }
}

// MARK: - HCalendarViewModel

@Reducer
struct HCalendarReducer {

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .onAppeared:
        state.displayDatesDescription = state.current
        return .none

      case let .tappedDate(date):
        state.selectedDate = date
        return .none

      case let .appearedDates(dates):
        state.displayDatesDescription = dates
        let targetMondayDate = dates[0]
        // 만약 nowMondayDate가 클 때 즉 prev이면서 값을 추가해야하는 상황이라면
        if dates == state.front.first,
           let toBeAddWeekForTargetDate = state.calendar.date(byAdding: .day, value: -7, to: targetMondayDate) {
          let toBeAddWeek = datesForWeek(of: toBeAddWeekForTargetDate)
          state.front = [toBeAddWeek] + state.front
        } else if
          dates == state.back.last,
          let toBeAddWeekForTargetDate = state.calendar.date(byAdding: .day, value: +7, to: targetMondayDate) {
          let toBeAddWeek = datesForWeek(of: toBeAddWeekForTargetDate)
          state.back.append(toBeAddWeek)
        }
        return .none

      }
    }
  }

  @ObservableState
  struct State: Equatable {
    var displayDatesDescription: [Date]? = []
    var selectedDate = Date()
    let calendar = Calendar.current
    var front: [[Date]] = []
    var back: [[Date]] = []
    var current: [Date] = []

    init() {
      if let front1 = calendar.date(byAdding: .day, value: -14, to: selectedDate) {
        let page = datesForWeek(of: front1)
        front.append(page)
      }
      if let front2 = calendar.date(byAdding: .day, value: -7, to: selectedDate) {
        let page = datesForWeek(of: front2)
        front.append(page)
      }

      if let back1 = calendar.date(byAdding: .day, value: +7, to: selectedDate) {
        let page = datesForWeek(of: back1)
        back.append(page)
      }
      if let back2 = calendar.date(byAdding: .day, value: +14, to: selectedDate) {
        let page = datesForWeek(of: back2)
        back.append(page)
      }
      current = datesForWeek(of: selectedDate)
      displayDatesDescription = current
    }
  }

  enum Action: Equatable {
    case tappedDate(Date)
    case appearedDates([Date])
    case onAppeared
  }
}

private func datesForWeek(of date: Date) -> [Date] {
  var calendar = Calendar.current
  calendar.firstWeekday = 2 // 월요일을 주의 첫 날로 설정

  let currentWeekday = calendar.component(.weekday, from: date)
  let daysToSubtract = (currentWeekday + 5) % 7

  let weekStartDate = calendar.date(byAdding: .day, value: -daysToSubtract, to: date)!

  var weekDates: [Date] = []
  for dayOffset in 0 ..< 7 {
    if let weekDate = calendar.date(byAdding: .day, value: dayOffset, to: weekStartDate) {
      weekDates.append(weekDate)
    }
  }

  return weekDates
}

/// 요일 추출
private func day(from date: Date) -> String {
  dateFormatter.setLocalizedDateFormatFromTemplate("E")
  return dateFormatter.string(from: date)
}

private var dateFormatter = DateFormatter()
