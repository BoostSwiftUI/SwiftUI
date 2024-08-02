//
//  FrequentlyEaten.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import SwiftUI

private enum ChipInfo: String, CaseIterable {
    case all = "전체"
    case food = "음식"
    case set = "세트"
    case popular = "인기"
}

struct FrequentlyEaten: View {
    @Environment(ModelData.self) var modelData
    
    @State private var selectedChip: ChipInfo = .popular
    
    private var currentDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M월 dd일"
        return dateFormatter.string(from: Date())
    }
    
    var body: some View {
        ZStack {
            Color.componentBackground
            
            VStack(alignment: .leading, spacing: 0) {
                chipButtons()
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        if selectedChip == .popular {
                            frequentlyEatenGroup()
                        }
                        switch selectedChip {
                        case .all:
                            FoodList(foods: modelData.foods, isRankedList: false)
                        case .food:
                            FoodList(foods: modelData.foods.filter { $0.name.contains("밥")}, isRankedList: false)
                        case .set:
                            Image(.favoritesPlaceholder)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 20)
                                .padding(.top, 54)
                        case .popular:
                            FoodList(foods: modelData.foods, isRankedList: true)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func chipButtons() -> some View {
        HStack(spacing: 10) {
            ForEach(ChipInfo.allCases, id: \.self) { chip in
                Chip(title: chip.rawValue, isEnabled: selectedChip == chip )
                    .onTapGesture {
                        selectedChip = chip
                    }
            }
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.vertical, 11)
    }
    
    @ViewBuilder
    func frequentlyEatenGroup() -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                Text("남성")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundStyle(.textNormal)
                
                Image(.disclosure)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.textPlaceholder)
                
                Text("유저들이 자주 먹어요🔥")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundStyle(.textNormal)
            }
            Text("\(currentDateString) 아침 식사 기준")
                .font(.system(size: 15))
                .fontWeight(.regular)
                .foregroundStyle(.textPlaceholder)
        }
        .padding(.horizontal, 20)
        .padding(.top, 23)
    }
}

#Preview {
    FrequentlyEaten()
        .environment(ModelData())
}
