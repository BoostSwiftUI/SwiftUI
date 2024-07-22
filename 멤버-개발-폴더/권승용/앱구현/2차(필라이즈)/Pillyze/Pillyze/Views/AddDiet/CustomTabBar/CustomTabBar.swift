//
//  CustomTabBar.swift
//  Pillyze
//
//  Created by 권승용 on 7/21/24.
//

import SwiftUI

struct CustomTabBar: View {
    @Namespace var frequentlyEatenID
    @Namespace var favoritesID
    @Namespace var directAddID
    
    @State private var indicatorOffset = CGFloat.zero
    
    var body: some View {
        GeometryReader { proxy in
            ScrollViewReader { scrollViewProxy in
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            CustomTab(title: "자주 드셨어요")
                                .onTapGesture {
                                    withAnimation {
                                        scrollViewProxy.scrollTo(frequentlyEatenID)
                                    }
                                    indicatorOffset = 0
                                }
                            CustomTab(title: "즐겨찾기")
                                .onTapGesture {
                                    withAnimation {
                                        scrollViewProxy.scrollTo(favoritesID)
                                    }
                                    indicatorOffset = proxy.size.width / 3
                                }
                            CustomTab(title: "직접 등록")
                                .onTapGesture {
                                    withAnimation {
                                        scrollViewProxy.scrollTo(directAddID)
                                    }
                                    indicatorOffset = (proxy.size.width / 3) * 2
                                }
                        }
                        Divider()
                            .overlay {
                                HStack {
                                    Rectangle()
                                        .foregroundStyle(.appPrimary)
                                        .frame(width: proxy.size.width / 3, height: 2)
                                        .offset(x: indicatorOffset, y: -1)
                                        .animation(.default, value: indicatorOffset)
                                    Spacer()
                                }
                            }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            FrequentlyEaten(foods: ModelData().foods)
                                .id(frequentlyEatenID)
                            
                            Favorites(foods: ModelData().foods)
                                .id(favoritesID)
                            
                            DirectAdd(foods: ModelData().foods)
                                .id(directAddID)
                        }
                        .frame(width: proxy.size.width * 3)
                    }
                    .scrollTargetBehavior(.paging)
                }
                .ignoresSafeArea(edges: .bottom)
            }
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
