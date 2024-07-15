//
//  ViewModelable.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/13/24.
//

import Foundation

protocol ViewModelable {
    
    associatedtype Input
    associatedtype Output
    
    var output: Output { get }
    
    func bind(input: Input)
}
