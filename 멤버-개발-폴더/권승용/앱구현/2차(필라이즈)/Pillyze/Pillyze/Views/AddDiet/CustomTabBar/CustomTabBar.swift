//
//  CustomTabBar.swift
//  Pillyze
//
//  Created by 권승용 on 7/21/24.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                HStack(spacing: 0) {
                    CustomTab(title: "자주 드셨어요")
                    CustomTab(title: "즐겨찾기")
                    CustomTab(title: "직접 등록")
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        FrequentlyEaten(foods: ModelData().foods)
                        
                        Favorites(foods: ModelData().foods)
                        
                        DirectAdd(foods: ModelData().foods)
                    }
                    .frame(width: proxy.size.width * 3)
                }
                .scrollTargetBehavior(.paging)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

private struct CustomTab: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 18))
            .fontWeight(.bold)
            .foregroundStyle(.textNormal)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
    }
}

#Preview {
    CustomTabBar()
}
