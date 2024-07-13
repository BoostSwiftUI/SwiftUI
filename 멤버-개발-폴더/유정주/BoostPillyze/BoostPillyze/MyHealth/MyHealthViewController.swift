//
//  MyHealthViewController.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/13/24.
//

import UIKit
import SwiftUI

struct MyHealthRepresentView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        MyHealthViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

final class MyHealthViewController: BaseViewController {
    
    // MARK: - Setup
    
    override func setUpAttribute() {
        view.backgroundColor = Color.background
    }
}

// MARK: - Constant

private extension MyHealthViewController {
    
    enum Color {
        
        static let background = UIColor(resource: .primaryNormal)
    }
}

