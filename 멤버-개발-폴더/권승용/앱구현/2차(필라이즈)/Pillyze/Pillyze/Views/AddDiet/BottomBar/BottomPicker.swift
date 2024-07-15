//
//  BottomBar.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import SwiftUI

struct BottomPicker: View {
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            
            HStack {
                MealPicker()
                
                Text("에")
                    .font(.system(size: 18))
                    .fontWeight(.heavy)
                    .foregroundStyle(.textNormal)
                
                Button {
                    
                } label: {
                    Text("기록하기")
                        .buttonEnabledStyle()
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    BottomPicker()
}

struct MealPicker: View {
    var body: some View {
        HStack(spacing: 2) {
            Text("아침")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundStyle(.appPrimary)
            Image(.disclosure)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
        }
        .padding(.leading, 14)
        .padding(.trailing, 9.5)
        .padding(.vertical, 8.5)
        .background {
            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(.mealPickerBackground)
        }
    }
}
