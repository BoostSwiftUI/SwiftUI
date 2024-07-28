//
//  MiniReducer.swift
//  Pillyze
//
//  Created by MaraMincho on 7/27/24.
//

import Foundation


protocol Reducer {
  associatedtype State: ReducerState
  associatedtype Action: ReducerAction
  func body(_ state: inout State, _ action: Action) -> Effect<Action>
}

struct CurrentReducer: Reducer {
  struct State: ReducerState {
    // State properties
  }

  enum Action: ReducerAction {
    case tappedSome
    case tappedOne
  }

  func body(_ state: inout State, _ action: Action) -> Effect<Action> {
    switch action {
    case .tappedSome:
      return .run { sendHandler in
        await sendHandler.send(.tappedOne)
      }
    case .tappedOne:
      return .send(.tappedOne)
    }
  }
}

extension Reducer {
  func sendViewAction(_ action: Action) -> Effect<Action> {
    return .init(type: action)
  }

  @MainActor
  func send(_ action: Action) -> Effect<Action> {
    return .init(type: action)
  }
}

struct Effect<Action: ReducerAction> {
  let type: ReducerAction?

}


extension Effect {
  static var none: Self { .init(type: nil) }
  static func send(_ action: Action) -> Self {
    return .init(type: action)
  }
  static func run(completion: @escaping (EffectSend<Action>) async -> Void ) -> Effect<Action> {
    let send = EffectSend<Action>()
    Task {
      await completion(send)
    }
    return .none
  }

}

struct EffectSend<Action: ReducerAction> {

  @MainActor
  @discardableResult
  func send(_ action: Action) -> Effect<Action> {
    return .init(type: action)
  }
}

protocol ReducerState {}

protocol ReducerAction {}


