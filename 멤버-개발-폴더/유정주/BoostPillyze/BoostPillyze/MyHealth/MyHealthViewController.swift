//
//  MyHealthViewController.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/13/24.
//

import UIKit
import SwiftUI
import Combine

// MARK: - MyHealthRepresentView

struct MyHealthRepresentView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        MyHealthViewController(rootView: MyHealthView())
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

// MARK: - MyHealthViewController

final class MyHealthViewController: LayoutViewController<MyHealthView> {
    
    // MARK: - Attribute
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Setup
    
    override func setUpBinding() {
        contentView.didTapHealthScoreButton
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                guard let self else { return }
                moveToAddDietViewController()
            }
            .store(in: &cancellables)
    }
}

// MARK: - Move to AddDietViewController

private extension MyHealthViewController {
    
    func moveToAddDietViewController() {
        let addDietViewController = AddDietViewController()
        addDietViewController.modalPresentationStyle = .fullScreen
        present(addDietViewController, animated: true)
    }
}

