//
//  AddDietViewModelTests.swift
//  BoostPillyzeTests
//
//  Created by 유정주 on 7/15/24.
//

import XCTest
@testable import BoostPillyze
import Combine

final class AddDietViewModelTests: XCTestCase {

    private var cancellables: Set<AnyCancellable> = []
    
    override func tearDown() {
        cancellables.forEach { $0.cancel() }
        cancellables = []
        super.tearDown()
    }
    
    func test_viewDidLoad가_input되면_foods가_output됨() throws {
        // given
        let expectation = XCTestExpectation()
        let viewModel = AddDietViewModel()
        let input = AddDietViewModel.Input()
        viewModel.bind(input: input)
        input.viewDidLoad.send()
        
        // when
        var output: [Food]? = nil
        viewModel.output.$foods
            .sink { foods in
                output = foods
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // then
        XCTAssertNotNil(output)
        XCTAssertEqual(output?.count, 30)
    }
    
    func test_toggleFoodSelection이_input되면_select결과가_output됨() {
        // given
        let expectation = XCTestExpectation()
        let viewModel = AddDietViewModel()
        let input = AddDietViewModel.Input()
        viewModel.bind(input: input)
        input.viewDidLoad.send()
        
        let food = Food(name: "", unit: "", caloriesPerUnit: 0, rank: 0, rankChange: 0)
        input.toggleFoodSelection.send(food)
        
        // when
        var output: Set<Food>? = nil
        viewModel.output.$selectedFoods
            .sink { selectedFoods in
                output = selectedFoods
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // then
        let target: Set<Food> = [food]
        XCTAssertNotNil(output)
        XCTAssertEqual(output, target)
    }
    
    func test_toggleFoodSelection이_input되면_deselect결과가_output됨() {
        // given
        let expectation = XCTestExpectation()
        let viewModel = AddDietViewModel()
        let input = AddDietViewModel.Input()
        viewModel.bind(input: input)
        input.viewDidLoad.send()
        
        let food = Food(name: "", unit: "", caloriesPerUnit: 0, rank: 0, rankChange: 0)
        input.toggleFoodSelection.send(food)
        input.toggleFoodSelection.send(food)
        
        // when
        var output: Set<Food>? = nil
        viewModel.output.$selectedFoods
            .sink { selectedFoods in
                output = selectedFoods
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // then
        let target: Set<Food> = []
        XCTAssertNotNil(output)
        XCTAssertEqual(output, target)
    }
}
