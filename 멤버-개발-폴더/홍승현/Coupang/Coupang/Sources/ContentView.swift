//
//  ContentView.swift
//  Coupang
//
//  Created by 홍승현 on 7/7/24.
//

import SwiftUI

struct ContentView: View {

  @Environment(ModelData.self) private var modelData

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          HStack {
            NavigationLink {

            } label: {
              CategoryMenuView(systemImageName: "wonsign.arrow.trianglehead.counterclockwise.rotate.90", title: "최고 할인")
            }

            NavigationLink {

            } label: {
              CategoryMenuView(systemImageName: "airplane.departure", title: "로켓 배송")
            }
          }

          Divider()

          LazyVGrid(
            columns: [.init(), .init()],
            alignment: .leading,
            spacing: 10
          ) {
            ForEach(modelData.categories, id: \.self) { category in
              NavigationLink {

              } label: {
                HStack {
                  Text(category.categoryIcon)
                  Text(category.categoryName)
                }
              }
            }
          }
          .foregroundStyle(.primary)
        }
      }
    }
  }
}

#Preview {
  ContentView()
    .environment(ModelData())
}
