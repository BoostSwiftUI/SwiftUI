//
//  AddDietViewModelInputOutput.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/15/24.
//

import Foundation
import Combine

extension AddDietViewModel {
    
    // MARK: - Input
    
    struct Input {
     
        let viewDidLoad: PassthroughSubject<Void, Never> = .init()
        let toggleFoodSelection: PassthroughSubject<Food, Never> = .init()
        
        let didTapCancelButton: PassthroughSubject<Void, Never> = .init()
        let didTapFoodListItem: PassthroughSubject<Food, Never> = .init()
    }
    
    // MARK: - Output
    
    final class Output: ObservableObject {
        
        @Published var foods: [Food] = []
        @Published var selectedFoods: Set<Food> = []
        @Published var totalCalories: Int = 0
    }
}
