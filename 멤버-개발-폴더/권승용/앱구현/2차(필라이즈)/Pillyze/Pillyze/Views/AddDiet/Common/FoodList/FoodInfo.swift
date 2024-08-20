//
//  FoodInfo.swift
//  Pillyze
//
//  Created by 권승용 on 7/15/24.
//

import SwiftUI

struct FoodInfo: View {
    let food: Food
    let isRankedList: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            foodDetail()
            
            Spacer()
            
            HStack(spacing: 12) {
                Text("\(food.caloriesPerUnit)kcal")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundStyle(.textSecondary)
                AddButton(food: food)
            }
        }
        .padding(.vertical, 16)
        .padding(.trailing, 20)
    }
    
    @ViewBuilder
    func foodDetail() -> some View {
        HStack(spacing: 6) {
            if isRankedList {
                switch food.rankChangeStatus {
                case .down:
                    Image(.rankDown)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                case .up:
                    Image(.rankUp)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                case .maintain:
                    Image(.rankMaintain)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                }
            } else {
                Image(.rankMaintain)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
            }
            
            VStack(alignment: .leading) {
                Text(food.name)
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .foregroundStyle(.textNormal)
                Text(food.unit)
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .foregroundStyle(.textPlaceholder)
            }
        }
    }
}

struct AddButton: View {
    @Environment(ModelData.self) private var modelData
    @State private var isAdded: Bool = false
    let food: Food
    
    var body: some View {
        Image(isAdded ? .dietSelected : .dietUnselected)
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .onTapGesture {
                isAdded.toggle()
                if isAdded {
                    modelData.isAdded = true
                    modelData.selectedFoods[food] = food.hashValue
                } else {
                    modelData.selectedFoods[food] = nil
                }
            }
            .animation(.easeInOut, value: isAdded)
            .disabled(modelData.isAdded)
            .onAppear {
                if modelData.selectedFoods[food] != nil {
                    isAdded = true
                }
            }
            .onChange(of: modelData.selectedFoods) { oldValue, newValue in
                if newValue[food] != nil {
                    isAdded = true
                } else {
                    isAdded = false
                }
            }
    }
}

#Preview {
    FoodInfo(food: ModelData().foods.first!, isRankedList: false)
        .environment(ModelData())
}
