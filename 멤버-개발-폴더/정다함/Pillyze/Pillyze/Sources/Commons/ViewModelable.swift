//
//  ViewModelable.swift
//  Pillyze
//
//  Created by MaraMincho on 7/28/24.
//

import Foundation
import Combine

protocol ViewModelable: AnyObject {
  associatedtype State
  associatedtype Action
  var state: State { get set }
  var subscription: AnyCancellable? { get set }
  var sendAction: PassthroughSubject<Action, Never> { get set }
  func setSubscriptions()
}

extension ViewModelable {
  func sendAction(_ action: Action) {
    sendAction.send(action)
  }
}

extension ViewModelable {
  // scope 메서드 정의
  func scope<Item: ViewModelable>(_ item: Item, action: @escaping (Item.Action) -> Action, subscriptions: inout Set<AnyCancellable>) {
    item.sendAction
      .receive(on: RunLoop.main)
      .sink { [weak self] currentAction in
        self?.sendAction.send(action(currentAction))
      }
      .store(in: &subscriptions)
  }
}
