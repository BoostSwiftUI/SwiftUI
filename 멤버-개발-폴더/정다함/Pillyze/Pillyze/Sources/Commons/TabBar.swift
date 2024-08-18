//
//  TabBar.swift
//  Pillyze
//
//  Created by MaraMincho on 7/30/24.
//

import Combine
import SwiftUI

// MARK: - TabBarViewModel

@Observable
final class TabBarViewModel: ViewModelable {
  init() {
    setSubscriptions()
  }

  var sendAction: PassthroughSubject<Action, Never> = .init()
  var state: State = .init()
  struct State {
    var currentType: TabBarType = .health
  }

  enum Action: Equatable {
    case tapped(TabBarType)
    case tappedPlusButton
  }

  var subscription: AnyCancellable? = nil

  func postNotification(_ type: TabBarType) {
    NotificationCenter.default.post(name: type.notificationName, object: nil)
  }

  func setSubscriptions() {
    subscription = sendAction
      .receive(on: RunLoop.main)
      .sink { [weak self] action in
        guard let self else {
          return
        }
        switch action {
        case let .tapped(type):
          state.currentType = type
          postNotification(type)
        case .tappedPlusButton:
          break
        }
      }
  }
}

// MARK: - TabBarView

struct TabBarView: View {
  @Bindable
  var viewModel: TabBarViewModel
  var state: TabBarViewModel.State { viewModel.state }
  var body: some View {
    ZStack(alignment: .bottom) {
      makeTabBarListButton()
        .shadow(color: Color(.primaryFL).opacity(0.1), radius: 16, x: 0, y: 0)
      centerAddButton()
        .padding(.bottom, 12)
    }
  }

  @ViewBuilder
  private func centerAddButton() -> some View {
    Button {
      viewModel.sendAction(.tappedPlusButton)
    } label: {
      Circle()
        .foregroundStyle(Color.primaryFL)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .center) {
          Image(.plus)
            .foregroundStyle(Color.white)
        }
    }
    .frame(width: 56, height: 56)
  }

  @ViewBuilder
  private func makeTabBarListButton() -> some View {
    ZStack(alignment: .bottom) {
      UnevenRoundedRectangle(topLeadingRadius: 24, topTrailingRadius: 24).fill(Color.white)
        .ignoresSafeArea()
      HStack(spacing: 0) {
        makeTabBarButton(type: .health)
        Spacer()
        makeTabBarButton(type: .phill)
      }
      .padding(.horizontal, 40)
    }
    .frame(maxWidth: .infinity, maxHeight: 60)
  }

  @ViewBuilder
  private func makeTabBarButton(type: TabBarType) -> some View {
    let isSelected = type == state.currentType
    VStack(spacing: 8) {
      type
        .image
        .renderingMode(.template)
        .resizable()
        .scaledToFit()
        .frame(width: 24, height: 24)
        .foregroundStyle(isSelected ? Color.primaryFL : Color.primaryDisabled)

      Text(type.title)
        .applyFont(.medium, size: ._12)
        .foregroundStyle(isSelected ? Color.primaryFL : Color.primaryDisabled)
    }
    .contentShape(Rectangle())
    .onTapGesture {
      viewModel.sendAction(.tapped(type))
    }
    .frame(width: 82)
  }
}

// MARK: - TabBarType

enum TabBarType: Int, Identifiable, Equatable, CaseIterable {
  case health
  case phill

  var id: Int { rawValue }

  var image: Image {
    switch self {
    case .health:
      Image(.myHealth)
    case .phill:
      Image(.nutrients)
    }
  }

  var title: String {
    switch self {
    case .health:
      "내 건강"
    case .phill:
      "영양제"
    }
  }

  var notificationName: Notification.Name {
    .init(rawValue: title)
  }
}
