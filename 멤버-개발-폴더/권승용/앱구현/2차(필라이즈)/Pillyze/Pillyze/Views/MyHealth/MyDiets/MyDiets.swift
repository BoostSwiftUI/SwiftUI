//
//  MyDiets.swift
//  Pillyze
//
//  Created by 권승용 on 7/13/24.
//

import SwiftUI

struct MyDiets: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Text("오늘 내 식사,\n몇 점 짜리 식단일까?")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
            Image(.myDiet)
                .resizable()
                .scaledToFit()
                .frame(width: 135, height: 135)
            
            Text("잘 먹어야 건강해요")
                .font(.system(size: 14))
                .fontWeight(.regular)
                .foregroundStyle(.appPrimary)
                .padding(.vertical, 10)
            
            NavigationLink {
                AddDiet(foods: ModelData().foods)
            } label: {
                Text("내 식단 점수 확인하기")
                    .buttonEnabledStyle()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .componentBackground()
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    Button {
                    } label: {
                        Image(.close)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    .padding(16)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    MyDiets()
}
