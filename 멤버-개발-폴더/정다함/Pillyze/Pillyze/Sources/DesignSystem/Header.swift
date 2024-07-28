//
//  Header.swift
//  Pillyze
//
//  Created by MaraMincho on 7/26/24.
//

import SwiftUI

struct MainHeader: View {
  var body: some View {
    HStack(alignment: .center, spacing: 0) {
      Image(.logo)
      Spacer()
      makeTrailingButton()
    }
    .padding(.all, Constants.padding)
    .frame(maxWidth: .infinity)
    .background(Color.primaryFL)
  }

  @ViewBuilder
  func makeTrailingButton() -> some View {
    HStack(spacing: 9) {
      ForEach(HeaderTrailingContent.allCases, id: \.self) { current in
        current
          .image
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 32, height: 32)
      }
    }
  }

  private enum Constants {
    static let padding: CGFloat = 16
  }

  private enum HeaderTrailingContent: CaseIterable {
    case calendar
    case alarm
    case person
    var image: Image {
      switch self {
      case .calendar:
          .init(.calendar)
      case .alarm:
          .init(.alarm)
      case .person:
          .init(.user)
      }
    }
  }
}
