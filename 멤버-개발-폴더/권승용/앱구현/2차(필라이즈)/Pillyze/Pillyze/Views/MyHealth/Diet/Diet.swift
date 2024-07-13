//
//  Diet.swift
//  Pillyze
//
//  Created by 권승용 on 7/13/24.
//

import SwiftUI

struct Diet: View {
    var body: some View {
        HStack(alignment: .bottom) {
            DietInfo()
            Spacer()
            Image(.whatDidYouEat)
                .resizable()
                .scaledToFit()
                .frame(width: 131)
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 14)
        .componentBackground()
    }
}

#Preview {
    Diet()
}

struct DietInfo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("식단")
                .font(.system(size: 14))
                .fontWeight(.medium)
            Text("0 kcal")
                .font(.system(size: 18))
                .fontWeight(.bold)
            NutritionalInformation(color: .carbohydrate, nutrition: "탄", ratio: 0)
            NutritionalInformation(color: .protein, nutrition: "단", ratio: 0)
            NutritionalInformation(color: .fat, nutrition: "지", ratio: 0)
        }
    }
}

private struct NutritionalInformation: View {
    let color: Color
    let nutrition: String
    let ratio: Int
    
    var body: some View {
        HStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 12, height: 12)
                .foregroundStyle(color)
            Text(nutrition)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundStyle(.textSecondary)
                .padding(.horizontal, 4)
            Text("\(ratio)%")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundStyle(.textSecondary)
        }
    }
}
