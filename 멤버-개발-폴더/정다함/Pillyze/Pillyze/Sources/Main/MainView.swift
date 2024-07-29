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
    makeCalendarView()
    ScrollView(.vertical) {
      LazyVStack(spacing: 0) {
        makeScoreView()
      }
      .padding(.all, 16)

    }
    .background(
      Color.primaryPlaceholder
        .clipShape(RoundedRectangle(cornerRadius: 16))
    )
    .ignoresSafeArea()
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
  }

  var body: some View {
    ZStack(alignment: .top) {
      Color.primaryFL.ignoresSafeArea()
      VStack(spacing: 0) {
        MainHeader(viewModel: viewState.headerViewModel)
        makeContent()
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
