//
//  FrequentlyEaten.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import SwiftUI

struct FrequentlyEaten: View {
    let foods: [Food]
    
    private var currentDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M월 dd일"
        return dateFormatter.string(from: Date())
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            chipButtons()
                .padding(.bottom, 23)
            ScrollView {
                VStack(alignment: .leading) {
                    frequentlyEatenGroup()
                    FoodList(foods: foods)
                }
            }
        }
    }
    
    @ViewBuilder
    func chipButtons() -> some View {
        HStack {
            Chip(title: "전체", isEnabled: .constant(false))
            Chip(title: "음식", isEnabled: .constant(false))
            Chip(title: "세트", isEnabled: .constant(false))
            Chip(title: "인기", isEnabled: .constant(true))
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
    }
}

#Preview {
    FrequentlyEaten(foods: ModelData().foods)
}
