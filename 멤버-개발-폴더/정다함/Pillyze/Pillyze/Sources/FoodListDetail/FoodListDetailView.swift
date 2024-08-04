// 
//  FoodListDetailView.swift
//  Pillyze
//
//  Created by MaraMincho on 8/4/24.
//
import SwiftUI
import ComposableArchitecture

struct FoodListDetailView: View {

  // MARK: Reducer
  @Bindable
  var store: StoreOf<FoodListDetail>

  @State var stepperIndicatorSize: CGFloat = 0
  @State var scrollViewSize: CGFloat = 0
  @State var stepperIndicatoerOffset: CGFloat = 0

  //MARK: Init
  init(store: StoreOf<FoodListDetail>) {
    self.store = store
  }

  // MARK: Content
  @ViewBuilder
  private func makeContentView() -> some View {
    VStack(spacing: 0) {
      makeTopSearchView()
      makeStepperView()
      makeStepperIndicator()
      makeDetailContentView()
    }
  }

  @ViewBuilder
  private func makeTopSearchView() -> some View {
    HStack(spacing: 8) {
      HStack(spacing: 4) {
        Image(.search)
          .resizable()
          .scaledToFit()
          .frame(width: 24, height: 24)

        TextField(
          "",
          text: $store.textFieldText.sending(\.changeTextField),
          prompt: Text(Constants.textFieldPrompt),
          axis: .vertical
        )
        .applyFont(.medium, size: ._14)
        .foregroundStyle(Color(.textAndIconPlaceholder))
      }
      .padding(.vertical, 16)
      .padding(.horizontal, 16)
      .background(Color(.primaryThird))
      .clipShape(Capsule())

      Text("취소")
        .applyFont(.medium, size: ._14)
    }
    .padding(.horizontal, 16)
  }

  @ViewBuilder
  private func makeStepperView() -> some View {
    HStack(spacing: 0) {
      ForEach(FoodDetailStepperTypes.allCases) { type in
        Text(type.title)
          .applyFont(.bold, size: ._18)
          .padding(.vertical, 18)
          .frame(maxWidth: .infinity)
          .contentShape(Rectangle())
          .onTapGesture {
            store.send(.tappedStepper(type))
          }
      }
    }
  }

  @ViewBuilder
  private func makeDetailContentView() -> some View {
    ScrollView(.horizontal) {
      LazyHStack(spacing: 0) {
        makeFrequentDetailView()
        makeFrequentDetailView()
        makeFrequentDetailView()
      }
      .background {
        GeometryReader { proxy in
          let offset = proxy.frame(in: .named("scroll")).minX
          Color.clear.preference(key: ScrollViewOffsetPreferenceKey.self, value: offset)
        }
      }
      .scrollTargetLayout()

    }
    .coordinateSpace(name: "scroll")
    .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
      if value > 0 {
        return
      }
      let absVal = abs(value)
      let currentOffset = CGFloat(Int(absVal / 3))
      stepperIndicatoerOffset = currentOffset
    }
    .scrollTargetBehavior(.viewAligned)
  }

  @ViewBuilder
  private func makeFrequentDetailView() -> some View {
    VStack(alignment: .leading, spacing: 0 ) {
      makeTopFilterView()
      ScrollView {
        makeFrequentContentView()
      }

    }
    .frame(width: scrollViewSize)
  }

  @ViewBuilder
  private func makeTopFilterView() -> some View {
    HStack(spacing: 10) {
      ForEach(FoodDetailFilterContentType.allCases) { item in
        let isSelected = item == store.frequentFilterType
        Button {
          store.send(.tappedFrequentFilter(item))
        } label: {
          Text(item.title)
            .applyFont(.medium, size: ._16)
            .foregroundStyle(isSelected ? Color.white : Color(.textSecondary))
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
        }
        .background{
          Capsule()
            .fill(isSelected ? Color(.primaryFL) : Color.white)
            .stroke(isSelected ? Color.clear : Color(.textSecondary))
          }
      }
    }
  }

  @ViewBuilder
  private func makeFrequentContentView() -> some View {
    VStack(alignment: .leading, spacing: 0) {
      VStack(alignment: .leading, spacing: 8) {
        Text("남성 유저들이 자주 먹어요🔥")
        Text("7월 31일 아침 식사 기준")
      }

      ForEach(store.foodList) { item in
        Text(item.foodName)
      }
    }
  }





  @ViewBuilder
  private func makeStepperIndicator() -> some View {
    Color(.primaryFL)
      .frame(width: stepperIndicatorSize,height: 2)
      .offset(x: -stepperIndicatorSize + stepperIndicatoerOffset)
  }

  var body: some View {
    ZStack(alignment: .top) {
      Color.white
        .ignoresSafeArea()
      makeContentView()
    }.getSize(sizedChanged: { size in
      stepperIndicatorSize = size.width / 3
      scrollViewSize = size.width
    })

    .onAppear{
      store.send(.isAppear(true))
    }
  }

  private enum Metrics {

  }
  
  private enum Constants {
    static let textFieldPrompt = "음식명, 브랜드명으로 검색"
  }
}


struct ScrollViewOffsetPreferenceKey: PreferenceKey {
  typealias Value = CGFloat
     static var defaultValue = CGFloat.zero
  static func reduce(value: inout Value, nextValue: () -> Value) {
    value += nextValue()
  }
}
