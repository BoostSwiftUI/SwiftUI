//
//  MyHealthHeaderView.swift
//  Pillyze
//
//  Created by 이준복 on 7/15/24.
//

import SwiftUI

struct MyHealthHeaderView: View {
    
    
    // MARK: - Body
    var body: some View {
        VStack() {
            HStack() {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 28)
                
                Spacer()
                
                Group {
                    Image(.calendar)
                        .resizable()
                        .scaledToFit()
                    
                    Image(.alarm)
                        .resizable()
                        .scaledToFit()
                    
                    Image(.user)
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(height: 32)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            
            
            MyHealthCalendarListView()
        }
        .background(.primaryNormal)
    }
    
}


#Preview {
    MyHealthHeaderView()
}
