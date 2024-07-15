//
//  AddDiet.swift
//  Pillyze
//
//  Created by 권승용 on 7/13/24.
//

import SwiftUI

struct AddDiet: View {
    var body: some View {
        VStack {
            HStack {
                SearchBar()
                Button {
                    
                } label: {
                    Text("취소")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundStyle(.textNormal)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    AddDiet()
}
