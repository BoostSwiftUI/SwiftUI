// 
//  FoodListDetail.swift
//  Pillyze
//
//  Created by MaraMincho on 8/4/24.
//
import ComposableArchitecture
import Combine
import Foundation

var lottiePublisher: PassthroughSubject<Void, Never> = .init()

@Reducer
struct FoodListDetail {

  @ObservableState
  struct State: Equatable {
    var isOnAppear = false
    var textFieldText: String = ""
    var currentStepperType: FoodDetailStepperTypes? = .frequently
    var frequentFilterType: FoodDetailFilterContentType = .all
    var favoriteFilterType: FoodDetailFilterContentType = .all
    var manuallyFilterType: FoodDetailFilterContentType = .all
    var foodList: [DisplayFoodProperty] = []
    var selectedFoodList: [DisplayFoodProperty] = []
    var isLottieAnimation: Bool = false
    var lottieAnimationTrigger: Int = 0

    init () {}
  }

  enum Action: Equatable {
    case isAppear(Bool)
    case changeTextField(String)
    case tappedStepper(FoodDetailStepperTypes?)
    case tappedFrequentFilter(FoodDetailFilterContentType)
    case tappedFavoriteFilter(FoodDetailFilterContentType)
    case tappedManuallyFilter(FoodDetailFilterContentType)
    case tappedFoodItem(DisplayFoodProperty)
    case tappedDismissButton
    case lottieAnimation(Bool)
  }

  enum CancelID {
    case debounceID
  }

  @Dependency(\.dismiss) var dismiss
  @Dependency(\.mainRunLoop) var runloop
  var body: some Reducer<State, Action> {
    Reduce { state, action in
      switch action {
      case let .lottieAnimation(val):
        state.isLottieAnimation = val

        return .none
      case let .isAppear(val):
        state.isOnAppear = val
        state.foodList = FoodListDetailNetwork.getJson()
        return .none
      case let .changeTextField(text):
        state.textFieldText = text
        return .none
      case let .tappedStepper(type):
        state.currentStepperType = type
        dump(state.currentStepperType)
        return .none
      case let .tappedFrequentFilter(type):
        state.frequentFilterType = type
        return .none
      case let .tappedFavoriteFilter(type):
        state.favoriteFilterType = type
        return .none
      case let .tappedManuallyFilter(type):
        state.manuallyFilterType = type
        return .none
      case let .tappedFoodItem(property):
        if state.selectedFoodList.contains(property) {
          state.selectedFoodList.removeAll(where: {$0 == property})
        }else {
          state.selectedFoodList.append(property)
          return .run { send in
            await send(.lottieAnimation(false))
            try await Task.sleep(nanoseconds: 50_000_000)
            await send(.lottieAnimation(true))
          }
        }
        return .none
      case .tappedDismissButton:
        return .run { send in
          await dismiss()
        }
      }
    }
  }
}

extension Reducer where Self.State == FoodListDetail.State, Self.Action == FoodListDetail.Action { }


enum FoodDetailStepperTypes: CaseIterable, Identifiable {
  case frequently
  case favorite
  case manually

  var id: Int {
    let val = FoodDetailStepperTypes.allCases.enumerated()
    return val.first(where: {$0.element == self})!.offset
  }
  var title: String {
    switch self {
    case .frequently:
      "자주 먹은 음식"
    case .favorite:
      "즐겨찾기"
    case .manually:
      "직접등록"
    }
  }
}


enum FoodDetailFilterContentType: CaseIterable, Identifiable, Equatable {
  case all
  case food
  case combo
  case popular

  var title: String {
    switch self {
    case .all:
      "전체"
    case .food:
      "음식"
    case .combo:
      "세트"
    case .popular:
      "인기"
    }
  }

  var id: Int {
    let val = Self.allCases.enumerated()
    return val.first(where: {$0.element == self})!.offset
  }
}
