//
//  TabBarItem.swift
//  Pillyze
//
//  Created by 이준복 on 7/15/24.
//

import SwiftUI

struct TabBarItem: View {
    // MARK: - Attributes
    private let title: String
    private let imageResource: ImageResource
    
    // MARK: - Init
    init(component: TabBarComponents) {
        self.title = component.title
        self.imageResource = component.imageResource
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            Image(imageResource)
                .renderingMode(.template)
            Text(title)
                .font(.system(size: 12))
        }
        .frame(width: 82, height: 60)
    }
}

#Preview {
    TabBarItem(component: .myHealth)
}
