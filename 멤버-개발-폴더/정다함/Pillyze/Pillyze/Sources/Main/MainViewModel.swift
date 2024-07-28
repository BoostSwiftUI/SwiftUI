//
//  MainViewModel.swift
//  Pillyze
//
//  Created by MaraMincho on 7/28/24.
//

import Foundation
import Combine

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
    scope(state.calendarViewModel, action: {.calendar($0)}, subscriptions: &subscriptions)

    subscription = sendAction
      .receive(on: RunLoop.main)
      .sink { [weak self] action in
        switch action {
        case .calendar:
          break
        case .header:
          break
        }
      }
  }

  var state: State

  struct State {
    var headerViewModel = HeaderViewModel()
    var calendarViewModel = HCalendarViewModel()
  }
  
  enum Action: Equatable {
    case header(HeaderViewModel.Action)
    case calendar(HCalendarViewModel.Action)
  }
}
