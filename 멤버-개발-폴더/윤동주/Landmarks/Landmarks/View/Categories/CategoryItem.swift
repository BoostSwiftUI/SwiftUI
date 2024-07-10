//
//  CategoryItem.swift
//  Landmarks
//
//  Created by 윤동주 on 7/4/24.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original) //색상이 포함된 이미지일 경우 그 색상으로 적용. 이거 안 쓰면 시스템 기본 색상으로 변환되어 렌더링될 수 있음.
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundStyle(.primary) // System Theme에 따라 다른 색상 보임(다크모드)
                .font(.caption)
        }
        .padding(.horizontal, 7.5)
    }
}


#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
