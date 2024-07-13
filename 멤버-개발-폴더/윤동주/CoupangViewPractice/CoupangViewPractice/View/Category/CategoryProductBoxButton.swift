//
//  CategoryProductBoxButton.swift
//  CoupangViewPractice
//
//  Created by 윤동주 on 7/8/24.
//

import SwiftUI

struct CategoryProductBoxButton: View {
    
    var image: Image
    var buttonTitle: String
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button {
            guard let action = self.action else { return }
            action()
        } label: {
            VStack {
                self.image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                Text(buttonTitle)
                    .tint(.black)
            }
            .frame(width: 100)
            .padding(.vertical, 10)
            .overlay(Rectangle()
                .stroke(.white, lineWidth: 0.5)
                .shadow(radius: 1)
            )
        }
    }
}

#Preview {
    CategoryProductBoxButton(image: Image("rocket"),
                             buttonTitle: "로켓배송")
}
