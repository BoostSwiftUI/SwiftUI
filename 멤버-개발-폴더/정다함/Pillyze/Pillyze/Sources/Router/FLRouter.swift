//
//  FLRouter.swift
//  Pillyze
//
//  Created by MaraMincho on 7/30/24.
//

import Combine
import SwiftUI
import ComposableArchitecture

// MARK: - FLRouterViewModel

@Observable final class FLRouterViewModel {
  var sceneType: TabBarType = .health
  init() {
    addObserver()
  }

  func addObserver() {
    NotificationCenter.default.addObserver(forName: TabBarType.health.notificationName, object: nil, queue: .main) { _ in
      self.sceneType = .health
    }
    NotificationCenter.default.addObserver(forName: TabBarType.phill.notificationName, object: nil, queue: .main) { _ in
      self.sceneType = .phill
    }
  }
}

// MARK: - FLRouterView

struct FLRouterView: View {
  @Bindable var viewModel: FLRouterViewModel
  @State var mainViewStore: StoreOf<MainViewReducer> = .init(initialState: .init()) {
    MainViewReducer()
  }
  @State var tabBarStore: StoreOf<TabBarViewReducer> = .init(initialState: .init()) {
    TabBarViewReducer()
  }

  init(viewModel: FLRouterViewModel) {
    self.viewModel = viewModel
  }

  @ViewBuilder func showView() -> some View {
    switch viewModel.sceneType {
    case .health:
      MainView(store: mainViewStore)
    case .phill:
      PhillView()
    }
  }

  var body: some View {
    showView()
      .safeAreaInset(edge: .bottom) {
        TabBarView(store: tabBarStore)
      }
  }
}
