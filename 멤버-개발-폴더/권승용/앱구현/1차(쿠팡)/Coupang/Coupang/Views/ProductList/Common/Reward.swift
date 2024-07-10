//
//  Reward.swift
//  Coupang
//
//  Created by 권승용 on 7/8/24.
//

import SwiftUI

struct Reward: View {
    let reward: Int
    
    var body: some View {
        HStack {
            Label {
                Text("최대 \(reward)원 적립")
                    .font(.caption)
                    .fontWeight(.bold)
            } icon: {
                Image(systemName: "bitcoinsign.circle.fill")
                    .foregroundStyle(.yellow)
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 8)
        .background {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundStyle(.rewardBackground)
        }
    }
}

#Preview {
    Reward(reward: 2998)
}
