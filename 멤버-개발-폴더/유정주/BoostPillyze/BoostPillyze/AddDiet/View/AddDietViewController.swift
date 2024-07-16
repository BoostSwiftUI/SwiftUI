//
//  AddDietViewController.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/14/24.
//

import UIKit
import SwiftUI
import Combine

final class AddDietViewController: LayoutViewController<AddDietView> {
    
    // MARK: - Attribute
    
    private let viewModel = AddDietViewModel()
    private let input = AddDietViewModel.Input()
    private var output: AddDietViewModel.Output { viewModel.output }
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializer
    
    init() {
        super.init(rootView: AddDietView(output: viewModel.output))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input.viewDidLoad.send()
    }
    
    // MARK: - Setup
    
    override func setUpBinding() {
        setUpViewModelBinding()
        setUpContentViewBinding()
    }
    
    private func setUpViewModelBinding() {
        viewModel.bind(input: input)
    }
    
    private func setUpContentViewBinding() {
        contentView.didTapCancelButton
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                guard let self else { return }
                dismiss(animated: true)
            }
            .store(in: &cancellables)
        
        contentView.didTapFoodListItem
            .receive(on: RunLoop.main)
            .sink { [weak self] food in
                guard let self else { return }
                input.toggleFoodSelection.send(food)
            }
            .store(in: &cancellables)
    }
}
