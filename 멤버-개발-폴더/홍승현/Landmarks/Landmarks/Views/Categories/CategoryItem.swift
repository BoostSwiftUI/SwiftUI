//
//  CategoryItem.swift
//  Landmarks
//
//  Created by 홍승현 on 7/4/24.
//

import SwiftUI

struct CategoryItem: View {

  let landmark: Landmark

  var body: some View {
    VStack(alignment: .leading) {
      landmark.image
        .renderingMode(.original)
        .resizable()
        .frame(width: 155, height: 155)
        .clipShape(RoundedRectangle(cornerRadius: 5))

      Text(landmark.name)
        .foregroundStyle(.primary)
        .font(.caption)
    }
    .padding(.leading, 15)
  }
}

#Preview {
  CategoryItem(landmark: ModelData().landmarks[0])
}
