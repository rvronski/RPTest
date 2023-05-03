//
//  AppFactory.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import UIKit

class AppFactory {
    
    
    private let coreDataManager: CoreDataManagerProtocol
    private let networkManager: NetworkProtocol
    
    init(coreDataManager: CoreDataManagerProtocol, networkManager: NetworkProtocol) {
        self.coreDataManager = coreDataManager
        self.networkManager = networkManager
    }
    
    func makeModule(ofType moduleType: Module.ModuleType) -> Module {
        switch moduleType {
        case .home:
            let viewModel = HomeViewModel(networkManager: networkManager)
            let view = UINavigationController(rootViewController: HomeViewController(viewModel: viewModel))
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
        case .like:
            let viewModel = LikeViewModel()
            let view = UINavigationController(rootViewController: LikeViewController())
            return Module(moduleType: moduleType, viewModel: viewModel, view: view)
       
        }
    }
}
