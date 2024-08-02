//
//  DirectAdd.swift
//  Pillyze
//
//  Created by 권승용 on 7/16/24.
//

import SwiftUI

private enum ChipInfo: String, CaseIterable {
    case all = "전체"
    case food = "음식"
    case set = "세트"
    case recipe = "레시피"
}

struct DirectAdd: View {
    @Environment(ModelData.self) var modelData
    @State private var selectedChip: ChipInfo = .all
    
    var body: some View {
        ZStack {
            Color.componentBackground
            
            VStack(spacing: 0) {
                directAddBanner()
                chipButtons()
                
                ScrollView {
                    switch selectedChip {
                    case .all:
                        FoodList(foods: modelData.foods, isRankedList: false)
                    case .food:
                        FoodList(foods: modelData.foods, isRankedList: false)
                    case .set:
                        Image(.directAddPlaceholder)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)
                            .padding(.top, 54)
                    case .recipe:
                        FoodList(foods: modelData.foods, isRankedList: false)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func chipButtons() -> some View {
        HStack(spacing: 10) {
            ForEach(ChipInfo.allCases, id: \.self) { chipInfo in
                Chip(title: chipInfo.rawValue, isEnabled: selectedChip == chipInfo)
                    .onTapGesture {
                        selectedChip = chipInfo
                    }
            }
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
    DirectAdd()
        .environment(ModelData())
}
