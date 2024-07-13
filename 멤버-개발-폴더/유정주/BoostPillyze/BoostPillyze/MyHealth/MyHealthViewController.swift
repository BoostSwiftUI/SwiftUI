//
//  MyHealthViewController.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/13/24.
//

import UIKit
import SwiftUI

// MARK: - MyHealthRepresentView

struct MyHealthRepresentView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        MyHealthViewController(rootView: MyHealthView())
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

// MARK: - MyHealthViewController

final class MyHealthViewController: LayoutViewController<MyHealthView> {}
