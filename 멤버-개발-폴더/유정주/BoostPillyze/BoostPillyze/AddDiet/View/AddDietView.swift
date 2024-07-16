//
//  AddDietView.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/14/24.
//

import SwiftUI
import Combine

enum AddDietTab {
    
    case most
    case favorites
    case custom
}

struct AddDietView: View {
    
    // MARK: - Interface

    @ObservedObject var output: AddDietViewModel.Output
    
    let didTapCancelButton = PassthroughSubject<Void, Never>()
    let didTapFoodListItem = PassthroughSubject<Food, Never>()

    // MARK: - State
    
    @State private var searchKeyword = ""
    @State private var currentTab: AddDietTab = .most
    
    var body: some View {
        SearchHeaderView(
            didTapCancelButton: didTapCancelButton,
            searchKeyword: $searchKeyword
        )
        .padding(.horizontal)
        
        ZStack(alignment: .bottom) {
            TopTabBar(currentTab: $currentTab)
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.disabled)
        }
        
        switch currentTab {
        case .most:
            FoodList(
                didTapFoodListItem: didTapFoodListItem,
                foods: $output.foods,
                selectedFoods: $output.selectedFoods
            )
        case .favorites:
            Spacer()
        case .custom:
            Spacer()
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
            Button(
                action: {
                    currentTab = .most
                }, label: {
                    VStack {
                        Text("자주 드셨어요")
                            .font(.system(size: 18, weight: .bold))
                            .padding(.vertical, 9)
                            .padding(.horizontal, 15)
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(currentTab == .most ? .primaryNormal : .background)
                    }
                }
            )
            .foregroundStyle(.black)
            
            Button(
                action: {
                    currentTab = .favorites
                }, label: {
                    VStack {
                        Text("즐겨찾기")
                            .font(.system(size: 18, weight: .bold))
                            .padding(.vertical, 9)
                            .padding(.horizontal, 15)
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(currentTab == .favorites ? .primaryNormal : .background)
                    }
                }
            )
            .foregroundStyle(.black)
            
            Button(
                action: {
                    currentTab = .custom
                }, label: {
                    VStack {
                        Text("직접 등록")
                            .font(.system(size: 18, weight: .bold))
                            .padding(.vertical, 9)
                            .padding(.horizontal, 15)
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(currentTab == .custom ? .primaryNormal : .background)
                    }
                }
            )
            .foregroundStyle(.black)
        }
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

// MARK: - Preview

#Preview {
    let viewModel = AddDietViewModel()
    let input = AddDietViewModel.Input()
    viewModel.bind(input: input)
    input.viewDidLoad.send()
    return AddDietView(output: viewModel.output)
}
