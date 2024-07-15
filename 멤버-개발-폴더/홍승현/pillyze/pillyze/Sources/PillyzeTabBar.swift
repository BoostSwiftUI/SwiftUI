//
//  PillyzeTabBar.swift
//  pillyze
//
//  Created by 홍승현 on 7/13/24.
//

import SwiftUI

struct PillyzeTabBar: View {
  @Binding var activeTab: Tabs

  var body: some View {
      HStack(alignment: .top, spacing: 115) {
        ForEach(Tabs.allCases, id: \.rawValue) { tab in
          TabBarItem(tab: tab, activeTab: $activeTab
          )
        }
      }
      .padding(.horizontal, 48)
      .background {
        UnevenRoundedRectangle(
          topLeadingRadius: Metrics.cornerRadius,
          topTrailingRadius: Metrics.cornerRadius
        )
          .fill(.white)
          .ignoresSafeArea()
          .shadow(color: .pillyzePrimary.opacity(0.1), radius: 8)
      }
      .background(.white) // 위 모서리가 rounded된 것이 검은 배경으로 보이는 현상 방지
      .overlay {
        Button {
          print("plus 버튼 탭")
        } label: {
          Image(.plus)
            .frame(
              maxWidth: Metrics.centerButtonSize,
              maxHeight: Metrics.centerButtonSize
            )
            .foregroundStyle(.white)
            .background(.pillyzePrimary)
            .clipShape(Circle())
            .offset(y: Metrics.centerButtonSize - Metrics.tabBarHeight - Metrics.centerButtonOffset)
        }
      }
  }
}

private struct TabBarItem: View {
  var tab: Tabs
  @Binding var activeTab: Tabs
  var body: some View {
    VStack(spacing: Metrics.centerButtonOffset) {
      tab.image.renderingMode(.template)
      Text(tab.rawValue)
        .font(.caption)
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 8)
    .foregroundStyle(activeTab == tab ? .pillyzePrimary : .disabled)
    .onTapGesture {
      activeTab = tab
    }
  }
}

private enum Metrics {
  static let centerButtonOffset: CGFloat = 8
  static let cornerRadius: CGFloat = 24
  static let centerButtonSize: CGFloat = 56
  static let tabBarHeight: CGFloat = 60
}

#Preview {
  PillyzeTabBar(activeTab: .constant(.myHealth))
}
