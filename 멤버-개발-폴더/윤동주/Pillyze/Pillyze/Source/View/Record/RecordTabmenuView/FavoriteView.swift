//
//  FavoriteView.swift
//  Pillyze
//
//  Created by 윤동주 on 7/30/24.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 54)
            Image(.noFood)
                .resizable()
                .frame(width: 250, height: 250)
            Text("자주 먹는 세트에\n별표를 누르면 즐겨찾기로 저장돼요")
                .multilineTextAlignment(.center)
                .foregroundStyle(.placeholderGray)
                .font(.Pretendard.medium(.size20).font)
            Spacer()
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    FavoriteView()
}
