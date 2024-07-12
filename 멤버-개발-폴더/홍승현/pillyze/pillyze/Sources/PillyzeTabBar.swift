//
//  PillyzeTabBar.swift
//  pillyze
//
//  Created by 홍승현 on 7/13/24.
//

import SwiftUI

struct PillyzeTabBar: View {
  @Binding var index: Int

  var body: some View {
    HStack(spacing: 30) {
      Button {

      } label: {
        TabBarItem(title: "내 건강", image: Image(systemName: "heart.fill"))
      }

      Button {

      } label: {
        Image(systemName: "plus")
          .resizable()
          .frame(width: 24, height: 24)
          .frame(maxWidth: 56, maxHeight: 56)
          .foregroundStyle(.white)
          .background(.pillyzePrimary)
          .clipShape(Circle())
          .offset(y: -Metrics.centerButtonOffset)
      }

      Button {

      } label: {
        TabBarItem(title: "영양제", image: Image(systemName: "pill.fill"))
      }
    }
    .padding(.top, Metrics.centerButtonOffset)
    .frame(height: Metrics.tabBarHeight)
    .frame(maxWidth: .infinity)
    .background(.background)
    .clipShape(TabBarBackgroundShape())
  }
}

private struct TabBarItem: View {
  let title: String
  let image: Image
  var body: some View {
    VStack(spacing: Metrics.centerButtonOffset) {
      image
      Text(title)
    }
    .frame(width: 82)
  }
}

struct TabBarBackgroundShape: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .init(x: 0, y: rect.height))
      path.addLine(to: .init(x: rect.width, y: rect.height))
      path
        .addLine(
          to: .init(
            x: rect.width,
            y: Metrics.cornerRadius + Metrics.centerButtonOffset
          )
        )
      path.addArc(
        tangent1End: .init(x: rect.width, y: Metrics.centerButtonOffset),
        tangent2End: .init(
          x: rect.width - Metrics.cornerRadius,
          y: Metrics.centerButtonOffset
        ),
        radius: Metrics.cornerRadius
      )
      path
        .addLine(
          to: .init(x: Metrics.cornerRadius, y: Metrics.centerButtonOffset)
        )
      path.addArc(
        tangent1End: .init(x: 0, y: Metrics.centerButtonOffset),
        tangent2End: .init(
          x: 0,
          y: Metrics.cornerRadius + Metrics.centerButtonOffset
        ),
        radius: Metrics.cornerRadius
      )
    }
  }
}

private enum Metrics {
  static let cornerRadius: CGFloat = 35
  static let centerButtonOffset: CGFloat = 8
  static let tabBarHeight: CGFloat = 60
}

#Preview {
  PillyzeTabBar(index: .constant(0))
}

#Preview("TabBarBackgroundShape") {
  VStack {
    Spacer()
    TabBarBackgroundShape()
      .frame(width: .infinity, height: Metrics.tabBarHeight)
      .background(.yellow)
  }
}
