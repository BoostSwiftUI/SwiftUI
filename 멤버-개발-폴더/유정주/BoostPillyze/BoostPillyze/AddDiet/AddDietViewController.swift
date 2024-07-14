//
//  AddDietViewController.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/14/24.
//

import UIKit
import SwiftUI

struct AddDietRepresentView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        AddDietViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

final class AddDietViewController: LayoutViewController<AddDietView> {
    
    // MARK: - Initializer
    
    init() {
        super.init(rootView: AddDietView())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
