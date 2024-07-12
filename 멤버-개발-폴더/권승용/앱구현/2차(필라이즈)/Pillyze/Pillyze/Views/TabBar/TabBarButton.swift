//
//  TabBarButton.swift
//  Pillyze
//
//  Created by 권승용 on 7/12/24.
//

import SwiftUI

struct TabBarButton: View {
    let enabledResource: ImageResource
    let disabledResource: ImageResource
    let title: String
    var isEnabled: Bool
    
    var body: some View {
        VStack {
            Image(isEnabled ? enabledResource: disabledResource)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
            Text(title)
                .font(.system(size: 12))
                .fontWeight(.medium)
        }
        .foregroundStyle(isEnabled ? .appPrimary : .appDisabled)
    }
}

#Preview {
    TabBarButton(enabledResource: .myHealthEnabled, disabledResource: .myHealthDisabled, title: "내 정보", isEnabled: true)
}
