//
//  MainView.swift
//  Pillyze
//
//  Created by MaraMincho on 7/28/24.
//

import SwiftUI

struct MainView: View {

  @Bindable
  var viewModel: MainViewModel
  var viewState: MainViewModel.State { viewModel.state }

  init(viewModel: MainViewModel) {
    self.viewModel = viewModel
  }

  @ViewBuilder
  private func makeContent() -> some View {
    ScrollView(.vertical) {
      makeCalendarView()
      ZStack {
        Color.primaryPlaceholder
          .clipShape(.rect(topLeadingRadius: 16, topTrailingRadius: 16))
          .ignoresSafeArea()

        LazyVStack(spacing: 16) {
          ForEach(MainViewContentType.allCases) { type in
            makeMainScrollViewContentView(type)
          }
        }
        .padding(.all, 16)
      }
    }
  }

  @ViewBuilder
  private func makeScoreView() -> some View {
    VStack(alignment: .center, spacing: 0) {
      Text("오늘 내 식사, \n몇 점 짜리 식단일까?")
        .multilineTextAlignment(.center)
        .applyFont(.bold, size: ._20)
        .foregroundStyle(.black)
        .frame(maxWidth: .infinity)

      Image(.mainTop)

      Text("잘 먹어야 건강해요")
        .applyFont(.regular, size: ._14)
        .foregroundStyle(Color.primaryFL)
        .padding(.vertical, 10)

      Button {
        viewModel.sendAction(.tappedTopScoreButton)
      } label: {
        Text("내 식단 점수 확인하기")
          .applyFont(.medium, size: ._18)
          .foregroundStyle(Color.white)
          .frame(maxWidth: .infinity)
      }
      .padding(.vertical, 16)
      .frame(maxWidth: .infinity)
      .background(Color.primaryFL)
      .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 20)
    .overlay(alignment: .topTrailing) {
      Image(.close)
        .padding(.all, 16)
    }
    .addScrollViewBackground()
  }

  @ViewBuilder
  private func makeCalendarView() -> some View {
    HCalendarView(viewModel: viewState.calendarViewModel)
      .background(Color.primaryFL)
      .ignoresSafeArea()
  }

  var body: some View {
    ZStack(alignment: .top) {
      VStack(spacing: 0) {
        Color.primaryFL
        Color.primaryPlaceholder
      }
      .ignoresSafeArea()
      
      VStack(spacing: 0) {
        MainHeader(viewModel: viewState.headerViewModel)
        makeContent()
      }
    }
    .safeAreaInset(edge: .bottom) {
      TabBarView(viewModel: viewState.tabBarViewModel)
    }
  }

  @ViewBuilder
  private func makeDietView() -> some View {
    HStack(alignment: .bottom, spacing: 0) {
      makeDietLeadingView()
      Spacer()
      makeDietTrailingView()
    }
    .padding(.horizontal, 14)
    .padding(.vertical, 24)
    .addScrollViewBackground()
  }

  @ViewBuilder
  private func makeDietTrailingView() -> some View {
    VStack(alignment: .trailing, spacing: 0) {


      Image(.mainSchedular)
        .resizable()
        .scaledToFit()
        .frame(width: 64, height: 64)


      HStack(spacing: 0) {
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        SmoothTriangle()
          .fill(Color.primaryPlaceholder)
          .frame(width: 6, height: 8)
        Spacer()
      }

      Text("오늘 뭐 드셨나요?")
        .applyFont(.medium, size: ._14)
        .foregroundStyle(Color.textSecondary)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color.primaryPlaceholder)
        .clipShape(Capsule())

    }
  }

  @ViewBuilder
  private func makeDietLeadingView() -> some View {
    let dietProperty = viewState.dietProperty
    VStack(alignment: .leading, spacing: 8) {
      Text("식단")
        .applyFont(.medium, size: ._14)

      Text(dietProperty.totalCalsLabel)
        .applyFont(.bold, size: ._18)

      VStack(spacing: 8) {
        ForEach(DietDetailPropertyTypes.allCases){
          makeDietDetailPropertyView($0)
        }
      }
    }
  }

  private func makeDietDetailPropertyView(_ type: DietDetailPropertyTypes) -> some View {
    let portionLabel: String = {
      let res =
      switch type {
      case .carbohydrates:
        viewState.dietProperty.carbohydrates.description
      case .protein:
        viewState.dietProperty.protein.description
      case .lipid:
        viewState.dietProperty.lipid.description
      }

      return res + "%"
    }()

    return HStack(alignment: .center, spacing: 4) {
      RoundedRectangle(cornerRadius: 4)
        .foregroundStyle(type.leadingColor)
        .frame(width: 12, height: 12)

      Text(type.title)
        .applyFont(.regular, size: ._14)
        .foregroundStyle(Color.secondary)

      Text(portionLabel)
        .applyFont(.regular, size: ._14)
        .foregroundStyle(Color.secondary)
    }

  }

  @ViewBuilder
  private func makeEmptyView() -> some View {
    Color.white
      .frame(height: 170)
      .addScrollViewBackground()
  }

  @ViewBuilder
  private func makeMainScrollViewContentView(_ type: MainViewContentType) -> some View {
    switch type {
    case .score:
      makeScoreView()
    case .diet:
      makeDietView()
    case .empty:
      makeEmptyView()
    }
  }

  enum MainViewContentType: Int, Equatable, CaseIterable, Identifiable {
    case score
    case diet
    case empty
    var id: Int { rawValue }

  }

  enum DietDetailPropertyTypes: Int,  Identifiable, CaseIterable {
    case carbohydrates
    case protein
    case lipid

    var id: Int { rawValue }

    var leadingColor: Color {
      switch self {
      case .carbohydrates:
        //rgba(162, 134, 253, 1)
        Color(.init(srgbRed: 162 / 255, green: 134 / 255, blue: 253 / 255, alpha: 1))
      case .protein:
        //rgba(106, 174, 246, 1)
        Color(.init(srgbRed: 106 / 255, green: 174 / 255, blue: 246 / 255, alpha: 1))
      case .lipid:
        //rgba(104, 225, 216, 1)
        Color(.init(srgbRed: 104 / 255, green: 225 / 255, blue: 216 / 255, alpha: 1))
      }
    }

    var title: String {
      switch self {
      case .carbohydrates:
        "탄"
      case .protein:
        "단"
      case .lipid:
        "지"
      }
    }
  }
}

fileprivate extension View {
  func addScrollViewBackground() -> some View {
    background(Color.white)
      .clipShape(RoundedRectangle(cornerRadius: 24))
      .shadow(color: Color.primaryFL.opacity(0.1), radius: 16, x: 0, y: 0)
  }
}

struct SmoothTriangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height

        let top = CGPoint(x: width / 2, y: 0)
        let bottomRight = CGPoint(x: width, y: height)
        let bottomLeft = CGPoint(x: 0, y: height)

        path.move(to: bottomLeft)
        path.addQuadCurve(to: bottomRight, control: top)
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        path.closeSubpath()

        return path
    }
}
