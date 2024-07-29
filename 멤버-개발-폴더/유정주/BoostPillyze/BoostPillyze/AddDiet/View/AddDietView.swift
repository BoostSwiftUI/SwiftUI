//
//  AddDietView.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/14/24.
//

import SwiftUI
import Combine
import Lottie

struct AddDietView: View {
    
    // MARK: - Interface

    @ObservedObject private var output: AddDietViewModel.Output
    let input: AddDietViewModel.Input

    // MARK: - Source of Truth
    
    @State private var searchKeyword = ""
    @State private var currentTab: AddDietTab = .most
    @State private var categories: [String] = ["전체", "음식", "세트", "인기"]
    @State private var currentCategory: String = "인기"
    @State private var playbackMode: LottiePlaybackMode = LottiePlaybackMode.paused
    @State private var animationCount = 0
    
    // MARK: - Initializer
    
    init(
        input: AddDietViewModel.Input,
        output: AddDietViewModel.Output
    ) {
        self.input = input
        self.output = output
    }
    
    var body: some View {
        VStack {
            SearchHeaderView(
                didTapCancelButton: input.didTapCancelButton,
                searchKeyword: $searchKeyword
            )
            .padding(.horizontal)
            
            ZStack(alignment: .bottom) {
                TopTabBar(currentTab: $currentTab)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.disabled)
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        CategoryChipButton(currentCategory: $currentCategory, title: category)
                    }
                }
                .padding(.vertical, 11)
                .padding(.horizontal, 20)
            }
            
            switch currentTab {
            case .most:
                VStack(spacing: 0) {
                    FoodList(
                        didTapFoodListItem: input.didTapFoodListItem,
                        foods: $output.foods,
                        selectedFoods: $output.selectedFoods
                    )
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(Color.disabled)
                    
                    AdDietButton(totalCalories: $output.totalCalories)
                }
            case .favorites:
                PlaceholderView()
            case .custom:
                Spacer()
            }
        }
        .overlay {
            if animationCount > 0 {
                LottieView {
                    try await DotLottieFile.named("add-list")
                }
                .playing(.fromProgress(0, toProgress: 1, loopMode: .playOnce))
                .id(animationCount)
            }
        }
        .onReceive(input.didTapFoodListItem) { food in
            input.toggleFoodSelection.send(food)
            animationCount += 1
        }
    }
}

// MARK: - Search Header

private struct SearchHeaderView: View {
    
    let didTapCancelButton: PassthroughSubject<Void, Never>
    
    @Binding var searchKeyword: String
    
    var body: some View {
        HStack {
            HStack(spacing: 0) {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 16)
                TextField("음식명으로 검색", text: $searchKeyword)
                    .padding(.vertical)
                    .padding(.horizontal, 4)
            }
            .background(Color.primaryPlaceholder)
            .clipShape(Capsule())
            
            Button(
                action: {
                    didTapCancelButton.send()
                },
                label: {
                    Text("취소")
                        .font(.system(size: 15))
                }
            )
            .foregroundStyle(.black)
        }
    }
}

// MARK: - Top TabBar

private struct TopTabBar: View {
    
    @Binding var currentTab: AddDietTab
    
    var body: some View {
        HStack(spacing: 0) {
            TopTabBarItem(currentTab: $currentTab, myTab: .most)
            TopTabBarItem(currentTab: $currentTab, myTab: .favorites)
            TopTabBarItem(currentTab: $currentTab, myTab: .custom)
        }
    }
}

// MARK: - Top TabBar Item

private struct TopTabBarItem: View {
    
    // MARK: - Binding
    
    @Binding var currentTab: AddDietTab
    
    // MARK: - Attribute
    
    private let myTab: AddDietTab
    
    var body: some View {
        Button(
            action: {
                currentTab = myTab
            }, label: {
                VStack {
                    Text(myTab.title)
                        .font(.system(size: 18, weight: .bold))
                        .padding(.vertical, 9)
                        .padding(.horizontal, 15)
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(currentTab == myTab ? .primaryNormal : .background)
                }
            }
        )
        .foregroundStyle(.black)
    }
    
    // MARK: - Initializer
    
    init(currentTab: Binding<AddDietTab>, myTab: AddDietTab) {
        self._currentTab = currentTab
        self.myTab = myTab
    }
}

// MARK: - Chip Button

private struct CategoryChipButton: View {
    
    @Binding var currentCategory: String
    
    private let title: String
    
    var body: some View {
        Button(
            action: {
                currentCategory = title
            },
            label: {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(currentCategory == title ? .background : .textPlaceholder)
                    .clipShape(Capsule())
                    .padding(.vertical, 4)
                    .padding(.horizontal, 16)
                    .background(
                        Group {
                            if currentCategory == title {
                                Capsule()
                                    .fill(Color.primaryNormal)
                            } else {
                                Capsule()
                                    .stroke(Color.disabled, lineWidth: 1)
                            }
                        }
                    )
            }
        )
    }
    
    init(currentCategory: Binding<String>, title: String) {
        self._currentCategory = currentCategory
        self.title = title
    }
}

// MARK: - Food List

private struct FoodList: View {
    
    let didTapFoodListItem: PassthroughSubject<Food, Never>
    
    @Binding var foods: [Food]
    @Binding var selectedFoods: Set<Food>
    
    var body: some View {
        List {
            ForEach(foods) { food in
                let isSelected = selectedFoods.contains(food)
                FoodListItem(food: food, isSelected: isSelected)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        didTapFoodListItem.send(food)
                    }
            }
        }
        .listStyle(.inset)
    }
}

// MARK: - Food List Item

private struct FoodListItem: View {
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(food.rank)")
                .font(.system(size: 16, weight: .bold))
                .frame(width: 30, alignment: .leading)
            
            Image(arrowImageResource)
                .padding(.leading, 8)
            
            VStack(alignment: .leading) {
                Text(food.name)
                    .font(.system(size: 16))
                Text(food.unit)
                    .font(.system(size: 16))
                    .foregroundStyle(.textPlaceholder)
            }
            .padding(.leading, 8)
            
            Spacer()
            
            Text("\(food.caloriesPerUnit)kcal")
                .foregroundStyle(.textSecondary)
            
            Image(isSelected ? .addDietFoodActiveOn : .addDietFoodActiveOff)
                .padding(.leading, 12)
        }
    }
    
    // MARK: - Attribute
    
    private let food: Food
    private let isSelected: Bool
    
    private var arrowImageResource: ImageResource {
        if food.rankChange == 0 {
            .addDietFoodArrowNoChange
        } else if food.rankChange > 0 {
            .addDietFoodArrowUp
        } else {
            .addDietFoodArrowDown
        }
    }
    
    // MARK: - Initializer
    
    init(food: Food, isSelected: Bool) {
        self.food = food
        self.isSelected = isSelected
    }
}

// MARK: - AddDietButton

private struct AdDietButton: View {
    
    @Binding var totalCalories: Int
    
    var body: some View {
        HStack {
            HStack(spacing: 4) {
                Text("\(totalCalories)kcal")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color.primaryNormal)
                
                Text("를")
                    .font(.system(size: 16))
            }
            
            Spacer()
            
            Button(
                action: {},
                label: {
                    HStack {
                        Spacer()
                        Text("기록하기")
                            .font(.system(size: 18, weight: .medium))
                        Spacer()
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 24)
                    .foregroundStyle(Color.background)
                    .background(totalCalories == 0 ? .primaryDisabled : .primaryNormal)
                    .cornerRadius(8, corners: .allCorners)
                }
            )
            .frame(width: 205)
            .disabled(totalCalories == 0)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 20)
    }
}

// MARK: - Placeholder

private struct PlaceholderView: View {
    
    var body: some View {
        Spacer()
        Image(.addDietPlaceholder)
            .resizable()
            .scaledToFit()
        Spacer()
    }
}

// MARK: - Preview

#Preview {
    let viewModel = AddDietViewModel()
    let input = AddDietViewModel.Input()
    viewModel.bind(input: input)
    input.viewDidLoad.send()
    return AddDietView(input: input, output: viewModel.output)
}
