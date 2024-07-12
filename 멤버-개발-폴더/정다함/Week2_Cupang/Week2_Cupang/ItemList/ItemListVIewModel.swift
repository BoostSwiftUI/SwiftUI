//
//  ItemListVIewModel.swift
//  Week2_Cupang
//
//  Created by MaraMincho on 7/9/24.
//

import Foundation


final class ItemListViewModel: ObservableObject {
  @Published var itemList: [ItemModelElement] = []

  func loadItemList() {
    guard let url = Bundle.main.url(forResource: "ItemList", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let items = try? JSONDecoder().decode([ItemModelElement].self, from: data) else {
      return
    }
    Task {
      await updateItems(items)
    }
  }

  enum ViewAction {
    case tappedItem
    case onAppear
  }
  func send(_ action :ViewAction) {
    switch action {
    case .tappedItem:
      NavigationPathPublisher.send(.detail)
      return
    case .onAppear:
      loadItemList()
    }
  }

  @MainActor
  func updateItems(_ items: [ItemModelElement]) {
    self.itemList = items
  }

}
