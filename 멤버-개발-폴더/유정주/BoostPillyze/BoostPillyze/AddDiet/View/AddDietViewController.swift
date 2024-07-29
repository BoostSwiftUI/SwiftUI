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
    
    private let viewModel: AddDietViewModel
    private var input: AddDietViewModel.Input { contentView.input }
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializer
    
    init() {
        viewModel = .init()
        let input = AddDietViewModel.Input()
        let rootView = AddDietView(input: input, output: viewModel.output)
        viewModel.bind(input: input)
        print("init")
        super.init(rootView: rootView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        input.viewDidLoad.send()
    }
    
    // MARK: - Setup
    
    override func setUpBinding() {
        setUpContentViewBinding()
    }
    
    private func setUpContentViewBinding() {
        input.didTapCancelButton
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                guard let self else { return }
                dismiss(animated: true)
            }
            .store(in: &cancellables)
    }
}
