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

struct TabBar: View {
    @State private var components: TabBarComponents = .myHealth
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 48)
            
            TabBarButton(enabledResource: .myHealthEnabled, disabledResource: .myHealthDisabled, title: "내 건강", isEnabled: components == .myHealth )
                .frame(width: 82, height: 60)
                .onTapGesture {
                    components = .myHealth
                }
            
            Spacer()
            Image(.addButton)
                .offset(y: -12)
            
            Spacer()
            TabBarButton(enabledResource: .nutrientsEnabled, disabledResource: .nutrientsDisabled, title: "영양제", isEnabled: components == .nutrients)
                .frame(width: 82, height: 60)
                .onTapGesture {
                    components = .nutrients
                }
            
            Spacer()
                .frame(width: 48)
        }
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.background)
                .shadow(radius: 3)
        }
    }
}

#Preview {
    TabBar()
}
