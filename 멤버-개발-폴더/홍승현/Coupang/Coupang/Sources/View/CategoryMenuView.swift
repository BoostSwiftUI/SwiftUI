//
//  CategoryMainHeaderView.swift
//  Coupang
//
//  Created by 홍승현 on 7/7/24.
//

import SwiftUI

struct CategoryMenuView: View {
  let systemImageName: String
  let title: String

  var body: some View {
    VStack(spacing: 10) {
      Image(systemName: systemImageName)
      Text(title)
    }
    .padding(.horizontal, 60)
    .padding(.vertical, 25)
    .background(Color(red: 0.98, green: 0.98, blue: 0.98))
    .overlay {
      Rectangle()
        .stroke(Color(red: 0.96, green: 0.96, blue: 0.96), lineWidth: 3)
    }
    .font(.system(size: 15))
    .tint(.black)
  }
}

#Preview {
  CategoryMenuView(
    systemImageName: "square.and.arrow.down.on.square",
    title: "최고 할인"
  )
}
