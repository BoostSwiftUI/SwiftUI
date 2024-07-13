//
//  MainTabBar.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/13/24.
//

import SwiftUI

enum Tab {
    
    case myHealth
    case nutrients
}

struct MainTabBar: View {
    
    // MARK: - Binding
    
    @Binding var selectedTab: Tab
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            HStack(alignment: .bottom) {
                Spacer()
                
                Button() {
                    selectedTab = .myHealth
                } label: {
                    TabBarItem(imageResource: .buttonTabbarMyHealth, title: "내 건강")
                        .foregroundStyle(
                            selectedTab == .myHealth ? Color.primaryNormal : Color.disabled
                        )
                }
                
                Spacer()
                    .frame(width: 115)
                
                Button() {
                    selectedTab = .nutrients
                } label: {
                    TabBarItem(imageResource: .buttonTabbarNutrients, title: "영양제")
                        .foregroundStyle(
                            selectedTab == .nutrients ? Color.primaryNormal : Color.disabled
                        )
                }
                
                Spacer()
            }
            
            Button {
                print("추가")
            } label: {
                Image(.buttonTabbarAdd)
                    .offset(y: -12)
            }
        }
    }
    
    // MARK: - BackgroundView
    
    struct BackgroundView: View {
        
        var body: some View {
            Rectangle()
                .foregroundStyle(Color.background)
                .cornerRadius(24, corners: [.topLeft, .topRight])
                .shadow(color: .primaryNormal.opacity(0.1), radius: 16)
                .ignoresSafeArea(.all)
                .frame(height: 60)
        }
    }
    
    // MARK: - TabBarItem
    
    struct TabBarItem: View {
        
        var body: some View {
            VStack {
                Image(imageResource)
                    .renderingMode(.template)
                Text(title)
                    .font(.system(size: 12))
            }
            .frame(width: 82, height: 60)
        }
        
        // MARK: - Attribute
        
        private let imageResource: ImageResource
        private let title: String
        
        // MARK: - Initializer
        
        init(imageResource: ImageResource, title: String) {
            self.imageResource = imageResource
            self.title = title
        }
    }
}

// MARK: - Preview

#Preview {
    @State var selectedTab = Tab.myHealth
    return MainTabBar(selectedTab: $selectedTab)
}
