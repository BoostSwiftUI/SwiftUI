//
//  TopCategoryButton.swift
//  BoostCoupang
//
//  Created by 유정주 on 7/7/24.
//

import SwiftUI

struct TopCategoryButton: View {
    
    let iconName: String
    let title: String
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center) {
                Image(systemName: iconName)
                    .padding(10)
                    .foregroundStyle(.white)
                    .background(Color.black)
                    .clipShape(Circle())
                
                Text(title)
                    .foregroundStyle(.black)
            }
            Spacer()
        }
        .frame(height: 80)
        .padding(10)
        .background(Color.gray.opacity(0.1))
        .border(Color.gray.opacity(0.5))
    }
}

#Preview {
    TopCategoryButton(iconName: "percent", title: "제목")
}
