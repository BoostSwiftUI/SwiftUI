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
        viewModel.output.foods
            .sink { foods in
                output = foods
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // then
        XCTAssertNotNil(output)
        XCTAssertEqual(output?.count, 30)
    }
}
