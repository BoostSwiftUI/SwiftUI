//
//  AddDietViewModel.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/15/24.
//

import Foundation
import Combine

final class AddDietViewModel: ViewModelable {
    
    // MARK: - Interface
    
    let output = Output()
    
    func bind(input: Input) {
        input.viewDidLoad
            .sink { [weak self] in
                guard let self else { return }
                viewDidLoad()
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Attribute
    
    private var cancellables: Set<AnyCancellable> = []
}

// MARK: - Binding Action

private extension AddDietViewModel {
    
    func viewDidLoad() {
        fetchFoods()
    }
    
    func fetchFoods() {
        let foods: [Food] = JSONLoader.load("food_list_with_rank.json")
        output.foods = foods
    }
}
