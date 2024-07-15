//
//  DirectAdd.swift
//  Pillyze
//
//  Created by 권승용 on 7/16/24.
//

import SwiftUI

struct DirectAdd: View {
    let foods: [Food]
    
    var body: some View {
        VStack(spacing: 0) {
            directAddBanner()
            chipButtons()
            
            if foods.isEmpty {
                Image(.directAddPlaceholder)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 335, height: 335)
                    .padding(.horizontal, 20)
                    .padding(.top, 54)
                Spacer()
            } else {
                ScrollView {
                    FoodList(foods: foods, isRankedList: false)
                }
            }
        }
    }
    
    @ViewBuilder
    func chipButtons() -> some View {
        HStack(spacing: 10) {
            Chip(title: "전체", isEnabled: .constant(true))
            Chip(title: "음식", isEnabled: .constant(false))
            Chip(title: "세트", isEnabled: .constant(false))
            Chip(title: "레시피", isEnabled: .constant(false))
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.vertical, 11)
    }
    
    @ViewBuilder
    func directAddBanner() -> some View {
        HStack {
            Image(.search)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(.appPrimary)
            Text("찾는 음식이 없나요?")
            Spacer()
            directAddButton()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .background {
            Color(.directAddBackground)
        }
    }
    
    @ViewBuilder
    func directAddButton() -> some View {
        Button {
            
        } label: {
            Text("직접 등록")
                .font(.system(size: 16))
                .fontWeight(.light)
                .foregroundStyle(.textButton)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background {
                    RoundedRectangle(cornerRadius: 99)
                        .foregroundStyle(.appPrimary)
                }
        }
    }
}

#Preview("With data") {
    DirectAdd(foods: ModelData().foods)
}

#Preview("No data") {
    DirectAdd(foods: [])
}
