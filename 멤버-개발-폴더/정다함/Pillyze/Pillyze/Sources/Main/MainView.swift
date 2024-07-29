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
  func makeContent() -> some View {
    makeCalendarView()
    Spacer()
  }

  @ViewBuilder
  func makeCalendarView() -> some View {
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
