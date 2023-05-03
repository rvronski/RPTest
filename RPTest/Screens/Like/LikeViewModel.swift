//
//  LikeViewModel.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import Foundation

protocol LikeViewModelProtocol: ViewModelProtocol {
    func getLike() -> [Like]
    func deleteLike(like: Like)
}

class LikeViewModel: LikeViewModelProtocol {
    
    private let coreDataManager: CoreDataManagerProtocol
    
    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
    
    func getLike() -> [Like] {
        coreDataManager.getLike()
    }
    
    func deleteLike(like: Like) {
        coreDataManager.deleteLike(like: like)
    }
}
