//
//  MainViewModel.swift
//  Pillyze
//
//  Created by MaraMincho on 7/28/24.
//

import ComposableArchitecture
import Foundation

// MARK: - MainViewModel

@Reducer
struct MainViewReducer {

  var body: some ReducerOf<Self> {
    Scope(state: \.header, action: \.header) {
      HeaderReducer()
    }

    Scope(state: \.calendar, action: \.calendar) {
      HCalendarReducer()
    }

    Scope(state: \.tabBar, action: \.tabBar) {
      TabBarViewReducer()
    }

    Reduce { state, action in
      switch action {
      case .tappedTopScoreButton:
        state.foodListDetail = .init()
        return .none
      case .calendar:
        return .none
      case .header:
        return .none
      case .tabBar:
        return .none
      case .foodListDetail:
        return .none
      }
    }
    .ifLet(\.$foodListDetail, action: \.foodListDetail) {
      FoodListDetail()
    }
  }

  @ObservableState
  struct State: Equatable {
    var header = HeaderReducer.State()
    var calendar = HCalendarReducer.State()
    var tabBar = TabBarViewReducer.State()
    var dietProperty: DietProperty = .default
    @Presents var foodListDetail: FoodListDetail.State?
  }

  enum Action: Equatable {
    case header(HeaderReducer.Action)
    case calendar(HCalendarReducer.Action)
    case tappedTopScoreButton
    case tabBar(TabBarViewReducer.Action)
    case foodListDetail(PresentationAction<FoodListDetail.Action>)
  }
}

// MARK: - DietProperty

struct DietProperty: Equatable {
  var totalCals: Int64
  var carbohydrates: Double
  var protein: Double
  var lipid: Double

  var totalCalsLabel: String {
    "\(totalCals) kcal"
  }
}

extension DietProperty {
  static var `default`: Self {
    return .init(totalCals: Int64.random(in: 1000 ... 5000), carbohydrates: 33, protein: 33, lipid: 33)
  }
}
