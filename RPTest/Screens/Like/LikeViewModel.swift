//
//  LikeViewModel.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import Foundation

protocol LikeViewModelProtocol: ViewModelProtocol {
    
}

class LikeViewModel: LikeViewModelProtocol {
    
    private let coreDataManager: CoreDataManagerProtocol
    private let networkManager: NetworkProtocol
    
    init(networkManager: NetworkProtocol, coreDataManager: CoreDataManagerProtocol) {
        self.networkManager = networkManager
        self.coreDataManager = coreDataManager
    }
}
