//
//  ViewMode.swift
//  Week2_Cupang
//
//  Created by MaraMincho on 7/9/24.
//

import Foundation
import Combine

final class CategoryViewModel: ObservableObject {
  @Published var categories: [Category] = []

  @Published var path: [NavigationPath] = []
  var isOnAppear: Bool = false
  var pathCancellable: Cancellable? = nil

  func subscribePublisher() {
    pathCancellable = NavigationPathPublisher.publisher()
      .receive(on: RunLoop.main)
      .sink { path in
        Task {
          await self.push(path)
        }
      }
  }

  @MainActor
  func push(_ currentPath: NavigationPath) {
    path.append(currentPath)
  }

  func loadCategories() {
    guard let url = Bundle.main.url(forResource: "Category", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let items = try? JSONDecoder().decode([Category].self, from: data) else {
      return
    }
    Task {
      await updateCategories(items)
    }
  }

  @MainActor
  func updateCategories(_ items: [Category]) {
    categories = items
  }

  func send(_ action: ViewAction) {
    switch action {
    case let .onAppear(val) :
      if isOnAppear {
        return
      }
      isOnAppear = val
      subscribePublisher()
      loadCategories()
    case .tappedCategory :
      NavigationPathPublisher.send(.itemList)
    }
  }

  enum ViewAction {
    case tappedCategory
    case onAppear(Bool)
  }
}
