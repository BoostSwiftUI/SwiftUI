//
//  MainViewModel.swift
//  Pillyze
//
//  Created by MaraMincho on 7/28/24.
//

import Combine
import Foundation

// MARK: - MainViewModel

@Observable
final class MainViewModel: ViewModelable {
  var subscription: AnyCancellable? = nil
  var subscriptions: Set<AnyCancellable> = .init()
  var sendAction: PassthroughSubject<Action, Never> = .init()

  init(state: State) {
    self.state = state
    setSubscriptions()
  }

  func setSubscriptions() {
    scope(state.headerViewModel, action: { .header($0) }, subscriptions: &subscriptions)
    scope(state.calendarViewModel, action: { .calendar($0) }, subscriptions: &subscriptions)
    scope(state.tabBarViewModel, action: { .tabBar($0) }, subscriptions: &subscriptions)
    subscription = sendAction
      .receive(on: RunLoop.main)
      .sink { [weak self] action in
        switch action {
        case .tappedTopScoreButton:
          break
        case .calendar:
          break
        case .header:
          break
        case .tabBar:
          break
        }
      }
  }

  var state: State

  struct State {
    var headerViewModel = HeaderViewModel()
    var calendarViewModel = HCalendarViewModel()
    var tabBarViewModel = TabBarViewModel()
    var dietProperty: DietProperty = .default
  }

  enum Action: Equatable {
    case header(HeaderViewModel.Action)
    case calendar(HCalendarViewModel.Action)
    case tappedTopScoreButton
    case tabBar(TabBarViewModel.Action)
  }
}

// MARK: - DietProperty

struct DietProperty {
  var totalCals: Int64
  var carbohydrates: Double
  var protein: Double
  var lipid: Double

  var totalCalsLabel: String {
    "\(totalCals) kcal"
  }
}

extension DietProperty {
  static var `default`: Self {
    return .init(totalCals: Int64.random(in: 1000 ... 5000), carbohydrates: 33, protein: 33, lipid: 33)
  }
}
