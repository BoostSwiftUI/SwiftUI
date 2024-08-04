//
//  Header.swift
//  Pillyze
//
//  Created by MaraMincho on 7/26/24.
//

import Combine
import ComposableArchitecture
import SwiftUI

// MARK: - HeaderViewModel

@Reducer
struct HeaderReducer {
  var subscription: AnyCancellable? = nil

  var sendAction: PassthroughSubject<Action, Never> = .init()

  struct State: Equatable {}

  enum Action: Equatable {
    case tappedCalendarButton
    case tappedAlarmButton
    case tappedUserButton
  }

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .tappedCalendarButton:
        print("캘린더 탭")
        return .none
      case .tappedAlarmButton:
        print("알람 탭")
        return .none
      case .tappedUserButton:
        print("User BUtton Tapped")
        return .none
      }
    }
  }
}

// MARK: - MainHeader

struct MainHeader: View {
  @Bindable
  var store: StoreOf<HeaderReducer>

  init(store: StoreOf<HeaderReducer>) {
    self.store = store
  }

  var body: some View {
    HStack(alignment: .center, spacing: 0) {
      Image(.logo)
      Spacer()
      makeTrailingButton()
    }
    .padding(.all, Constants.padding)
    .frame(maxWidth: .infinity)
    .background(Color.primaryFL)
  }

  @ViewBuilder
  func makeTrailingButton() -> some View {
    HStack(spacing: 9) {
      ForEach(HeaderTrailingContent.allCases, id: \.self) { current in
        current
          .image
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 32, height: 32)
          .contentShape(Rectangle())
          .onTapGesture {
            switch current {
            case .alarm:
              store.send(.tappedAlarmButton)
            case .calendar:
              store.send(.tappedCalendarButton)
            case .person:
              store.send(.tappedUserButton)
            }
          }
      }
    }
  }

  private enum Constants {
    static let padding: CGFloat = 16
  }

  private enum HeaderTrailingContent: CaseIterable {
    case calendar
    case alarm
    case person
    var image: Image {
      switch self {
      case .calendar:
        .init(.calendar)
      case .alarm:
        .init(.alarm)
      case .person:
        .init(.user)
      }
    }
  }
}
