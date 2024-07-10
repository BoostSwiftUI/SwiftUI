//
//  CategoryItem.swift
//  Landmarks
//
//  Created by 유정주 on 7/3/24.
//

import SwiftUI

struct CategoryItem: View {
 
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .center) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
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
