//
//  HomeViewModel.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import Foundation
protocol HomeViewModelProtocol: ViewModelProtocol {
    
}

class HomeViewModel: HomeViewModelProtocol {
    
    private let networkManager: NetworkProtocol
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
}
