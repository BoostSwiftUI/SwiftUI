//
//  FLRouter.swift
//  Pillyze
//
//  Created by MaraMincho on 7/30/24.
//

import SwiftUI
import Combine

@Observable final class FLRouterViewModel {
  var sceneType: TabBarType = .health
  var tabBarViewModel = TabBarViewModel()
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

struct FLRouterView: View {
  
  @Bindable var viewModel: FLRouterViewModel
  @State var mainViewModel = MainViewModel(state: .init())

  init(viewModel: FLRouterViewModel) {
    self.viewModel = viewModel
  }

  @ViewBuilder func showView() -> some View {
    switch viewModel.sceneType {
    case .health:
      MainView(viewModel: mainViewModel)
    case .phill:
      PhillView()
    }
  }

  var body: some View {
    showView()
      .safeAreaInset(edge: .bottom) {
        TabBarView(viewModel: viewModel.tabBarViewModel)
      }
  }
}

