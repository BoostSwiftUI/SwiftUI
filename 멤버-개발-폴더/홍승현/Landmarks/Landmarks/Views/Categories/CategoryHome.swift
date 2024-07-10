//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 홍승현 on 7/4/24.
//

import SwiftUI

struct CategoryHome: View {
  @Environment(ModelData.self) var modelData

  var body: some View {
    NavigationSplitView {
      List {
        modelData.features[0].image
          .resizable()
          .scaledToFill()
          .frame(height: 200)
          .clipped()
          .listRowInsets(.init())

        ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
          CategoryRow(categoryName: key, items: modelData.categories[key]!)
        }
        .listRowInsets(.init())
      }
      .navigationTitle("Featured")
    } detail: {
      Text("Select a Landmark")
    }
  }
}

#Preview {
  CategoryHome()
    .environment(ModelData())
}
