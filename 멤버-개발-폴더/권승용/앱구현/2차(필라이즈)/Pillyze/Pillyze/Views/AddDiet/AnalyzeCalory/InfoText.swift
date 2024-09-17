//
//  InfoText.swift
//  Pillyze
//
//  Created by 권승용 on 9/17/24.
//

import SwiftUI

struct InfoText: View {
    let text = "식품의 영양성분정보는 수확물의 품종, 발육, 생장환경 등에 따라 달리질 수 있으며, 조리법에 따라 달라질 수 있습니다. 계산된 칼로리 및 성분 정보는 평균적인 수치로 참고용으로 사용해야하며, 일부 정보에 오류가 있거나 누락이 있을 수 있습니다."
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Text("·")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .lineSpacing(12)
                .frame(width: 20, height: 20)
            
            Text(text)
                .font(.system(size: 14))
                .foregroundStyle(.textSecondary)
                .lineSpacing(3)
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 20)
    }
}

#Preview {
    InfoText()
}
