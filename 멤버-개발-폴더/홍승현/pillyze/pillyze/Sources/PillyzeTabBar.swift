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
    ZStack {
      HStack(spacing: 115) {
        Button {
          print("건강 탭")
        } label: {
          TabBarItem(title: "내 건강", image: Image(systemName: "heart.fill"))
        }

        Button {
          print("영양제 탭")
        } label: {
          TabBarItem(title: "영양제", image: Image(systemName: "pill.fill"))
        }
      }

      Button {
        print("plus 버튼 탭")
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
    }
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

private enum Metrics {
  static let centerButtonOffset: CGFloat = 8
}

#Preview {
  PillyzeTabBar(index: .constant(0))
}
