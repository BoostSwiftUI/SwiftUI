//
//  TabBar.swift
//  Pillyze
//
//  Created by 권승용 on 7/12/24.
//

import SwiftUI

enum TabBarComponents {
    case myHealth
    case nutrients
}

fileprivate enum Constant {
    static let myHealth = "내 건강"
    static let nutrients = "영양제"
}

struct TabBar: View {
    @Binding var components: TabBarComponents
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                            .frame(width: 48)
                        
                        TabBarButton(
                            enabledResource: .myHealthEnabled,
                            disabledResource: .myHealthDisabled,
                            title: Constant.myHealth,
                            isEnabled: components == .myHealth
                        )
                        .frame(width: 82, height: 60)
                        .onTapGesture {
                            components = .myHealth
                        }
                        
                        Spacer()
                        Image(.addButton)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 56)
                            .offset(y: -12)
                        
                        Spacer()
                        TabBarButton(
                            enabledResource: .nutrientsEnabled,
                            disabledResource: .nutrientsDisabled,
                            title: Constant.nutrients,
                            isEnabled: components == .nutrients
                        )
                        .frame(width: 82, height: 60)
                        .onTapGesture {
                            components = .nutrients
                        }
                        
                        Spacer()
                            .frame(width: 48)
                    }
                    Spacer()
                        .frame(height: proxy.safeAreaInsets.bottom)
                }
                .background {
                    UnevenRoundedRectangle(
                        cornerRadii: RectangleCornerRadii(
                            topLeading: 24,
                            topTrailing: 24
                        ))
                    .foregroundStyle(.componentBackground)
                    .shadow(color: .appShadow, radius: 16)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    TabBar(components: .constant(.myHealth))
}
