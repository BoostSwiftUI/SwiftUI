//
//  Header.swift
//  Pillyze
//
//  Created by MaraMincho on 7/26/24.
//

import Combine
import SwiftUI

// MARK: - HeaderViewModel

@Observable
final class HeaderViewModel: ViewModelable {
  var state: State = .init()
  init() {
    setSubscriptions()
  }

  var subscription: AnyCancellable? = nil

  var sendAction: PassthroughSubject<Action, Never> = .init()
  func setSubscriptions() {
    subscription = sendAction
      .subscribe(on: RunLoop.main)
      .sink { action in
        switch action {
        case .tappedAlarmButton:
          print("tappedAlarmButton")
        case .tappedCalendarButton:
          print("tappedCalendarButton")
        case .tappedUserButton:
          print("tappedUserButton")
        }
      }
  }

  struct State {}

  enum Action: Equatable {
    case tappedCalendarButton
    case tappedAlarmButton
    case tappedUserButton
  }
}

// MARK: - MainHeader

struct MainHeader: View {
  @Bindable
  var viewModel: HeaderViewModel

  init(viewModel: HeaderViewModel) {
    self.viewModel = viewModel
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
              viewModel.sendAction(.tappedAlarmButton)
            case .calendar:
              viewModel.sendAction(.tappedAlarmButton)
            case .person:
              viewModel.sendAction(.tappedUserButton)
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
