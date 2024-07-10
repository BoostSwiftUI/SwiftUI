//
//  CategoryRow.swift
//  Landmarks
//
//  Created by 홍승현 on 7/4/24.
//

import SwiftUI

struct CategoryRow: View {
  let categoryName: String
  let items: [Landmark]

  var body: some View {
    VStack(alignment: .leading) {
      Text(categoryName)
        .font(.headline)
        .padding(.leading, 15)
        .padding(.top, 5)

      ScrollView(.horizontal) {
        HStack(alignment: .top, spacing: 0) {
          ForEach(items) { landmark in
            NavigationLink {
              LandmarkDetail(landmark: landmark)
            } label: {
              CategoryItem(landmark: landmark)
            }
          }
        }
      }
      .scrollIndicators(.hidden)
      .frame(height: 185)
    }
  }
}

#Preview {
  let landmarks = ModelData().landmarks
  return CategoryRow(
    categoryName: landmarks[0].category.rawValue,
    items: Array(landmarks.prefix(4))
  )
}
