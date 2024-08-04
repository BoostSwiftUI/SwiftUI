// 
//  MainViewReducer.swift
//  Pillyze
//
//  Created by MaraMincho on 8/4/24.
//
import Foundation
import ComposableArchitecture
import FeatureAction

@Reducer
struct MainViewReducer {

  @ObservableState
  struct State: Equatable {
    var isOnAppear = false
    init () {}
  }

  enum Action: Equatable, FeatureAction {
    case view(ViewAction)
    case inner(InnerAction)
    case async(AsyncAction)
    case scope(ScopeAction)
    case delegate(DelegateAction)
  }

  enum ViewAction: Equatable {
    case onAppear(Bool)
  }

  enum InnerAction: Equatable {}

  enum AsyncAction: Equatable {}

  @CasePathable
  enum ScopeAction: Equatable {}

  enum DelegateAction: Equatable {}

  var viewAction: (_ state: inout State, _ action: Action.ViewAction) -> Effect<Action> = { state, action in
    switch action {
    case let .onAppear(isAppear) :
      if state.isOnAppear {
        return .none
      }
      state.isOnAppear = isAppear
      return .none
    }
  }

  var scopeAction: (_ state: inout State, _ action: Action.ScopeAction) -> Effect<Action> = { state, action in
    return .none
  }

  var innerAction: (_ state: inout State, _ action: Action.InnerAction) -> Effect<Action> = { state, action in
    return .none
  }

  var asyncAction: (_ state: inout State, _ action: Action.AsyncAction) -> Effect<Action> = { state, action in
    return .none
  }

  var delegateAction: (_ state: inout State, _ action: Action.DelegateAction) -> Effect<Action> = { state, action in
    return .none
  }

  var body: some Reducer<State, Action> {
    Reduce { state, action in
      switch action {
      case let .view(currentAction):
        return viewAction(&state, currentAction)
      case let .inner(currentAction):
        return innerAction(&state, currentAction)
      case let .async(currentAction):
        return asyncAction(&state, currentAction)
      case let .scope(currentAction) :
        return scopeAction(&state, currentAction)
      case let .delegate(currentAction) :
        return delegateAction(&state, currentAction)
      }
    }
  }
}

extension Reducer where Self.State == MainViewReducer.State, Self.Action == MainViewReducer.Action { }
