//
//  SelectedFoodList.swift
//  Pillyze
//
//  Created by 권승용 on 9/15/24.
//

import SwiftUI

enum MealDuration {
    case underThirtyMinutes
    case overThirtyMinutes
    case overOneHour
}

struct SelectedFoodList: View {
    @Environment(ModelData.self) private var modelData
    @State private var selectedMealDuration: MealDuration = .underThirtyMinutes
    
    var body: some View {
        VStack(spacing: 0) {
            header
            selectedFoodList
        }
        .background {
            Color.componentBackground
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("아침")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundStyle(.textNormal)
                    .padding(.leading, 14)
                Spacer()
                Image(.disclosure)
                    .renderingMode(.template)
                    .foregroundStyle(.textNormal)
                    .padding(.trailing, 14)
            }
            .frame(width: 124, height: 50)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.componentBackground)
                    .shadow(color: Color(red: 0.93, green: 0.91, blue: 1), radius: 5, x: 0, y: 0)
            }
            Spacer()
            
            HStack(spacing: 4) {
                Text("식사시간 기록하기")
                    .font(.system(size: 16))
                    .foregroundStyle(.textSecondary)
                
                Image(.more)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
            }
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private var selectedFoodList: some View {
        @Bindable var modelData = modelData
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("New")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .foregroundStyle(.appPrimary)
                Spacer()
            }
            
            ForEach(modelData.selectedFoodsArray) { food in
                SelectedFoodRow(food: food)
            }
            
            mealDurationSelect
        }
        .padding(.horizontal, 20)
    }
    
    private var mealDurationSelect: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("식사는 얼마동안 하셨나요?⏰")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundStyle(.textSecondary)
            
            HStack {
                MealDurationButton(
                    title: "30분 이내",
                    mealDuration: .underThirtyMinutes,
                    selectedMealDuration: $selectedMealDuration
                )
                Spacer()
                MealDurationButton(
                    title: "30분 이상",
                    mealDuration: .overThirtyMinutes,
                    selectedMealDuration: $selectedMealDuration
                )
                Spacer()
                MealDurationButton(
                    title: "1시간 이상",
                    mealDuration: .overOneHour,
                    selectedMealDuration: $selectedMealDuration
                )
            }
        }
        .padding(.vertical, 32)
    }
}

struct MealDurationButton: View {
    let title: String
    let mealDuration: MealDuration
    @Binding var selectedMealDuration: MealDuration
    
    var body: some View {
        Text(title)
            .font(.system(size: 16))
            .fontWeight(.medium)
            .foregroundStyle(
                mealDuration == selectedMealDuration ? .white : .textSecondary
            )
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background {
                RoundedRectangle(cornerRadius: 99)
                    .foregroundStyle(
                        mealDuration == selectedMealDuration ? .appPrimary : .mealDurationButtonBackground
                    )
            }
            .onTapGesture {
                selectedMealDuration = mealDuration
            }
            .animation(.easeInOut, value: selectedMealDuration)
    }
}

struct SelectedFoodRow: View {
    @Environment(ModelData.self) private var modelData
    @State private var interval: CGFloat = 0
    let food: Food
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text(food.name)
                    .font(.system(size: 16))
                    .foregroundStyle(.textNormal)
                Text(food.unit)
                    .font(.system(size: 16))
                    .foregroundStyle(.textPlaceholder)
            }
            
            Spacer()
            
            HStack(spacing: 12) {
                Text("\(food.caloriesPerUnit)")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundStyle(.textSecondary)
                
                Image(.dietRemove)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .shake(interval)
                    .onTapGesture {
                        if modelData.selectedFoods.count > 1 {
                            modelData.selectedFoods.removeValue(forKey: food)
                        } else {
                            interval += 1
                        }
                    }
            }
        }
        .padding(.vertical, 16)
        .background {
            VStack {
                Spacer()
                Divider()
            }
        }
    }
}

fileprivate
extension View {
    func shake(_ interval: CGFloat) -> some View {
        self.modifier(ShakeEffect(interval))
            .animation(Animation.default, value: interval)
    }
}

fileprivate
struct ShakeEffect: GeometryEffect {
    var animatableData: CGFloat
    var amount: CGFloat = 3
    var shakeCount = 6
    
    init(_ interval: CGFloat) {
        self.animatableData = interval
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * CGFloat(shakeCount) * .pi), y: 0))
    }
}

#Preview {
    SelectedFoodList()
        .environment(ModelData())
}
