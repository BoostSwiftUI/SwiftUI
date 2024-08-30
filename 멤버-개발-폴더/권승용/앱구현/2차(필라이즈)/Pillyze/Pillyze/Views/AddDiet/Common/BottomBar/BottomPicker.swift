//
//  BottomBar.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import SwiftUI

struct BottomPicker: View {
    @Binding var isAddingList: Bool
    @Environment(ModelData.self) private var modelData
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            
            if isAddingList {
                Text("음식이 추가되었어요")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .padding(.top, 16)
                
            }
            
            HStack {
                MealPicker()
                
                Text("에")
                    .font(.system(size: 18))
                    .fontWeight(.heavy)
                    .foregroundStyle(.textNormal)
                    .padding(.trailing, 29)
                
                Button {
                    
                } label: {
                    Text("기록하기")
                        .myButtonStyle(isEnabled: !modelData.selectedFoods.isEmpty)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    BottomPicker(isAddingList: .constant(false))
        .environment(ModelData())
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
