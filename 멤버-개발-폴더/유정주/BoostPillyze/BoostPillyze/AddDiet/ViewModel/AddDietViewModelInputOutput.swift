//
//  AddDietViewModelInputOutput.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/15/24.
//

import Foundation
import Combine

extension AddDietViewModel {
    
    // MARK: - Input
    
    struct Input {
     
        let viewDidLoad: PassthroughSubject<Void, Never> = .init()
    }
    
    // MARK: - Output
    
    final class Output {
        
        @Published var foods: [Food] = []
    }
}
