//
//  DirectRegisterView.swift
//  Pillyze
//
//  Created by 윤동주 on 7/30/24.
//

import SwiftUI

struct DirectRegisterView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 54)
            Image(.noFood)
                .resizable()
                .frame(width: 250, height: 250)
            Text("넣고 싶은 음식이나 세트를 직접 등록하면\n바로 사용하실 수 있어요!")
                .multilineTextAlignment(.center)
                .foregroundStyle(.placeholderGray)
                .font(.Pretendard.medium(.size20).font)
            Spacer()
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    DirectRegisterView()
}
