//
//  CustomTabBar.swift
//  Pillyze
//
//  Created by 권승용 on 7/21/24.
//

import SwiftUI
import Lottie

enum TabSelection: Hashable {
    case frequentlyEaten
    case favorites
    case directAdd
}

struct CustomTabBar: View {
    @Environment(ModelData.self) private var modelData
    
    @State private var selection: TabSelection = .frequentlyEaten
    @State private var indicatorOffset = CGFloat.zero
    @State private var isLoading: Bool = true
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                TabBarHeader(selection: $selection, indicatorOffset: $indicatorOffset, proxy: proxy)
                    .onChange(of: selection) { oldValue, newValue in
                        switch newValue {
                        case .frequentlyEaten:
                            indicatorOffset = 0
                        case .favorites:
                            indicatorOffset = proxy.size.width / 3
                        case .directAdd:
                            indicatorOffset = (proxy.size.width / 3) * 2
                        }
                    }
                
                if isLoading {
                    VStack {
                        Spacer()
                        LottieView {
                            try await DotLottieFile.named("loading")
                        }
                        .playing(loopMode: .loop)
                        Spacer()
                    }
                }
                else {
                    TabView(selection: $selection) {
                        Group {
                            FrequentlyEaten(foods: modelData.foods)
                                .tag(TabSelection.frequentlyEaten)
                            
                            Favorites(foods: modelData.foods)
                                .tag(TabSelection.favorites)
                            
                            DirectAdd(foods: modelData.foods)
                                .tag(TabSelection.directAdd)
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .animation(.easeInOut(duration: 0.2), value: selection)}
                }
            }
            .ignoresSafeArea(edges: .bottom)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    isLoading = false
                }
            }
        }
    }
}

private struct TabBarHeader: View {
    @Binding var selection: TabSelection
    @Binding var indicatorOffset: CGFloat
    let proxy: GeometryProxy
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                customTab(title: "자주 드셨어요")
                    .onTapGesture {
                        selection = .frequentlyEaten
                    }
                
                customTab(title: "즐겨찾기")
                    .onTapGesture {
                        selection = .favorites
                    }
                
                customTab(title: "직접 등록")
                    .onTapGesture {
                        selection = .directAdd
                    }
            }
            indicatorBar()
        }
    }
    
    @ViewBuilder
    private func customTab(title: String) -> some View {
        Text(title)
            .font(.system(size: 18))
            .fontWeight(.bold)
            .foregroundStyle(.textNormal)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
    }
    
    @ViewBuilder
    private func indicatorBar() -> some View {
        Divider()
            .overlay {
                HStack {
                    Rectangle()
                        .foregroundStyle(.appPrimary)
                        .frame(width: proxy.size.width / 3, height: 2)
                        .offset(x: indicatorOffset, y: -1)
                        .animation(.easeInOut(duration: 0.2), value: indicatorOffset)
                    Spacer()
                }
            }
    }
}

#Preview {
    CustomTabBar()
        .environment(ModelData())
}
