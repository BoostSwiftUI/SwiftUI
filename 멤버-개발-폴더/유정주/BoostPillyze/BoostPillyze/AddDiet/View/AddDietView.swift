//
//  AddDietView.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/14/24.
//

import SwiftUI
import Combine

struct AddDietView: View {
    
    // MARK: - Interface

    @ObservedObject var output: AddDietViewModel.Output
    
    let didTapCancelButton = PassthroughSubject<Void, Never>()

    // MARK: - State
    
    @State private var searchKeyword = ""
    
    var body: some View {
        SearchHeaderView(
            didTapCancelButton: didTapCancelButton,
            searchKeyword: $searchKeyword
        )
        .padding(.horizontal)
        
        List {
            ForEach(output.foods) { food in
                FoodListItem(food: food)
            }
        }
        .listStyle(.inset)
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
        }
    }
    
    // MARK: - Attribute
    
    private let food: Food
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
    
    init(food: Food) {
        self.food = food
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
