//
//  TabBar.swift
//  Pillyze
//
//  Created by 이준복 on 7/15/24.
//

import SwiftUI

enum TabBarComponents {
    case myHealth
    case nutritional
    
    var title: String {
        switch self {
        case .myHealth: "내 건강"
        case .nutritional: "영양제"
        }
    }
    
    var imageResource: ImageResource {
        switch self {
        case .myHealth: .tabBarMyHealth
        case .nutritional: .tabBarNutrients
        }
    }
}

struct TabBar: View {
    
    // MARK: - Attributes
    @Binding var tabBarComponent: TabBarComponents
    
    // MARK: - Body
    var body: some View {
        ZStack {
            TabBarBackgroundView()
            
            HStack(alignment: .bottom) {
                Spacer()
                
                Button() {
                    tabBarComponent = .myHealth
                } label: {
                    TabBarItem(component: .myHealth)
                    .foregroundStyle(tabBarComponent == .myHealth ? .primaryNormal : .appDisabled)
                }
                
                Spacer()
                    .frame(width: 140)
                
                Button() {
                    tabBarComponent = .nutritional
                } label: {
                    TabBarItem(component: .nutritional)
                    .foregroundStyle(tabBarComponent == .nutritional ? .primaryNormal : .appDisabled)
                }
                
                Spacer()
            }
            
            Button {
                
            } label: {
                Image(.tabbarAdd)
                    .offset(y: -8)
            }
        }
    }
}

#Preview {
    @State var tabBarComponent = TabBarComponents.myHealth
    return TabBar(tabBarComponent: $tabBarComponent)
}
