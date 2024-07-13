//
//  Header.swift
//  Pillyze
//
//  Created by 권승용 on 7/12/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
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
    }
}

#Preview {
    Header()
        .background {
            Color(.appPrimary)
        }
}
