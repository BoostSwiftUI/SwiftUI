//
//  HCalendarView.swift
//  Pillyze
//
//  Created by MaraMincho on 7/28/24.
//

import SwiftUI
import Combine

struct HCalendarView: View {
  init(viewModel: HCalendarViewModel) {
    self.viewModel = viewModel
  }

  @Bindable
  var viewModel: HCalendarViewModel

  var state: HCalendarViewModel.State { viewModel.state }

  var body: some View {
    dayPageView
  }

  // MARK: - 일자 표시 뷰
  @ViewBuilder
  private var dayPageView: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack(spacing: 0) {
        ForEach(state.front + [state.current] +  state.back, id: \.self) { val in
          makePageView(val)
        }
      }
    }
  }

  @ViewBuilder
  private func makePageView(_ date: [Date]) -> some View {
    LazyHStack(spacing: 0) {
      ForEach(date, id: \.self) { date in
        let isSelected = state.selectedDate == date

        VStack(spacing: 12) {
          ZStack {
            Circle()
              .foregroundStyle(isSelected ? Color.white : Color.clear)
              .frame(maxWidth: 24, maxHeight: 24)

            Text(day(from: date))
              .applyFont(.medium, size: ._12)
              .foregroundStyle(isSelected ? Color.primaryFL : Color.primaryDisabled)
          }

          Text("\(state.calendar.component(.day, from: date))")
            .applyFont(.bold, size: ._24)
        }
        .padding(.top, 4)
        .padding(.bottom, 16)
        .frame(width: 49, height: 80)
        .contentShape(Rectangle())
        .onTapGesture {
          viewModel.sendAction(.tappedDate(date))
        }
      }
    }
    .frame(maxWidth: .infinity)
  }
}

@Observable 
final class HCalendarViewModel: ViewModelable {
  var sendAction: PassthroughSubject<Action, Never> = .init()
  var state: State = .init()

  init() {
    setSubscriptions()
  }

  var subscription: AnyCancellable? = nil
  func setSubscriptions() {
    subscription = sendAction
      .receive(on: RunLoop.main)
      .sink{[weak self] action in
        switch action {
        case let .tappedDate(date):
          self?.state.selectedDate = date
        }
      }
  }

  struct State {
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
        front.append(page)
      }
      if let back2 = calendar.date(byAdding: .day, value: +14, to: selectedDate) {
        let page = datesForWeek(of: back2)
        front.append(page)
      }
      current = datesForWeek(of: selectedDate)
    }
  }

  enum Action: Equatable {
    case tappedDate(Date)
  }
}

fileprivate func datesForWeek(of date: Date) -> [Date] {
  var calendar = Calendar.current
  calendar.firstWeekday = 2 // 월요일을 주의 첫 날로 설정

  // 주의 시작(월요일) 날짜를 찾기 위해 현재 날짜의 요일을 계산
  let currentWeekday = calendar.component(.weekday, from: date)
  let daysToSubtract = (currentWeekday + 5) % 7 // 월요일까지 며칠을 빼야 하는지 계산 (월요일을 기준으로)

  // 주의 시작(월요일) 날짜
  let weekStartDate = calendar.date(byAdding: .day, value: -daysToSubtract, to: date)!

  // 월요일부터 일요일까지의 날짜를 배열에 추가
  var weekDates: [Date] = []
  for dayOffset in 0..<7 {
    if let weekDate = calendar.date(byAdding: .day, value: dayOffset, to: weekStartDate) {
      weekDates.append(weekDate)
    }
  }

  return weekDates
}

/// 요일 추출
fileprivate func day(from date: Date) -> String {
  dateFormatter.setLocalizedDateFormatFromTemplate("E")
  return dateFormatter.string(from: date)
}

fileprivate var dateFormatter = DateFormatter()
