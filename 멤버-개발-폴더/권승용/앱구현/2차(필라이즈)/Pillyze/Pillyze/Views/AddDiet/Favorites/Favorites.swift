//
//  Favorites.swift
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

struct Favorites: View {
    @Environment(ModelData.self) var modelData
    @State private var selectedChip: ChipInfo = .all
    
    var body: some View {
        ZStack {
            Color.componentBackground
            
            VStack(spacing: 0) {
                chipButtons()
                
                ScrollView {
                    switch selectedChip {
                    case .all:
                        FoodList(foods: modelData.foods, isRankedList: false)
                    case .food:
                        FoodList(foods: modelData.foods, isRankedList: false)
                    case .set:
                        Image(.favoritesPlaceholder)
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
}

#Preview("With data") {
    Favorites()
        .environment(ModelData())
}
