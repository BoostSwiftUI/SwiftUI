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
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializer
    
    init() {
        super.init(rootView: AddDietView())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    override func setUpBinding() {
        contentView.didTapCancelButton
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                guard let self else { return }
                dismiss(animated: true)
            }
            .store(in: &cancellables)
    }
}
