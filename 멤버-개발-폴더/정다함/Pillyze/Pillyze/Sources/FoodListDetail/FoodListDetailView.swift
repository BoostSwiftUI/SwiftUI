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
        .foregroundStyle(Color(.textNormal))
        .onTapGesture {
          store.send(.tappedDismissButton)
        }
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

    ScrollViewReader { proxy in
      ScrollView(.horizontal) {
        LazyHStack(spacing: 0) {
          makeFrequentDetailView()
            .id(FoodDetailStepperTypes.frequently)
          makeFrequentDetailView()
            .id(FoodDetailStepperTypes.favorite)
          makeFrequentDetailView()
            .id(FoodDetailStepperTypes.manually)
        }
        .scrollPosition(id: $store.currentStepperType.sending(\.tappedStepper))
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
      .onChange(of: store.currentStepperType) { _, newValue in
        withAnimation {
          proxy.scrollTo(newValue)
        }
      }
    }

  }

  @ViewBuilder
  private func makeFrequentDetailView() -> some View {
    VStack(alignment: .leading, spacing: 0 ) {
      makeTopFilterView()
        .padding(.horizontal, 20)
        .padding(.vertical, 11)
      ScrollView {
        Spacer()
          .frame(height: 23)
        makeFrequentContentView()
      }
      .scrollIndicators(.hidden)

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
        Text("남성 ▼ 유저들이 자주 먹어요🔥")
          .applyFont(.bold, size: ._16)
          .foregroundStyle(Color.black)
        Text("7월 31일 아침 식사 기준")
          .applyFont(.regular, size: ._14)
          .foregroundColor(Color.textAndIconPlaceholder)
      }
      .padding(.horizontal, 20)
      ForEach(store.foodList) { item in
        makeFoodItem(item)
          .padding(.horizontal, 16)
      }
    }
  }

  @ViewBuilder
  private func makeFoodItem(_ property: DisplayFoodProperty) -> some View{

    let isSelectedItem = store.selectedFoodList.contains(property)
    HStack(alignment: .center, spacing: 8) {
        //Rank
      Text(property.currentRank.description)
        .applyFont(.bold, size: ._16)
        .foregroundStyle(Color(.black))

      HStack(alignment: .center, spacing: 6) {
        // Rank Image
        makeFoodItemRankChangeImageView(property.rankChange)
          .frame(width: 18, height: 18)

        // Middle Content
        VStack(alignment: .leading, spacing: 0) {
          Text(property.foodName)
            .applyFont(.regular, size: ._16)
            .foregroundStyle(Color(.black))
          Text(property.unit)
            .applyFont(.regular, size: ._16)
            .foregroundStyle(Color.textAndIconPlaceholder)
        }

        Spacer()
        HStack(spacing: 12) {
          Text(Constants.kcalFormatter(property.caloriesPerUnit))

          Button {
            store.send(.tappedFoodItem(property))
          } label: {
            ZStack {
              Circle()
                .frame(width: 22, height: 22)
                .foregroundStyle(isSelectedItem ? Color(.primaryFL) : Color(.primaryDisabled))

              Constants.cellIsSelectedImage(isSelectedItem)
                .renderingMode(.template)
                .foregroundStyle(Color.white)
                .frame(width: 16, height: 16)
            }

          }
        }
      }
    }
    .padding(.vertical, 16)
    .background(
      VStack{
        Spacer()
        Color(.textAndIconPlaceholder)
          .frame(height: 1)
      }
    )
  }

  @ViewBuilder
  private func makeFoodItemRankChangeImageView(_ rankChangedValue: Int64) -> some View {
    if rankChangedValue > 0  {
      Image(.arrowUp)
        .resizable()
        .scaledToFit()
    }else if rankChangedValue < 0 {
      Image(.arrowDown)
        .renderingMode(.template)
        .resizable()
        .scaledToFit()
        .foregroundColor(Color.blue)
    }else {
      Image(.arrowNochange)
        .resizable()
        .scaledToFit()
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
    .safeAreaInset(edge: .bottom, content: {
      makeBottomView()
    })

    .onAppear{
      store.send(.isAppear(true))
    }
  }

  @ViewBuilder
  private func makeBottomView() -> some View {
    let isPushable = !store.selectedFoodList.isEmpty
    let buttonText = isPushable ? store.selectedFoodList.count.description + "개 기록하기" : "기록하기"

    VStack(spacing: 8) {
      Color(.textAndIconPlaceholder)
        .frame(height: 1)
      Spacer()
        .frame(maxHeight: 16)
      if isPushable {
        Text("음식이 추가되었어요")
          .applyFont(.medium, size: ._16)
          .foregroundStyle(Color(.textSecondary))
      }

      HStack(spacing: 29) {
        HStack(spacing: 4) {
          HStack(spacing: 1) {
            Text("아침")
              .applyFont(.bold, size: ._20)
              .foregroundStyle(Color(.primaryFL))
            Image(.arrowDown)
              .resizable()
              .renderingMode(.template)
              .scaledToFit()
              .frame(width: 18, height: 18)
              .foregroundStyle(Color.primaryFL)
          }
          .padding(.horizontal, 14)
          .padding(.vertical, 8.5)
          .background(Color(.primaryThird).clipShape(RoundedRectangle(cornerRadius: 2)))
          .clipShape(RoundedRectangle(cornerRadius: 4))

          Text("에")
            .applyFont(.bold, size: ._20)
            .foregroundStyle(Color(.black))
        }



        Button {

        } label: {
          Text(buttonText)
            .applyFont(.medium, size: ._16)
            .foregroundStyle(Color.white)
            .padding(.vertical, 14.5)

        }
        .frame(maxWidth: 205)
        .background(isPushable ? Color(.primaryFL) : Color(.primaryDisabled))
        .clipShape(RoundedRectangle(cornerRadius: 8))

      }
    }

  }

  private enum Metrics {

  }
  
  private enum Constants {
    static let textFieldPrompt = "음식명, 브랜드명으로 검색"
    static func kcalFormatter(_ kcal: Int64) -> String {
      return kcal.description + "kcal"
    }
    static func cellIsSelectedImage(_ val: Bool) -> Image {
      val ? Image(.check) : Image(.plus)
    }
  }
}


struct ScrollViewOffsetPreferenceKey: PreferenceKey {
  typealias Value = CGFloat
     static var defaultValue = CGFloat.zero
  static func reduce(value: inout Value, nextValue: () -> Value) {
    value += nextValue()
  }
}
