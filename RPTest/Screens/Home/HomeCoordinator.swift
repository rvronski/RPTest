//
//  HomeCoordinator.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import UIKit

final class HomeCoordinator: ModuleCoordinatable {
    
    var moduleType: Module.ModuleType
    private let factory: AppFactory

    private(set) var module: Module?
    private(set) var coordinators: [Coordinatable] = []

    init(moduleType: Module.ModuleType, factory: AppFactory) {
        self.moduleType = moduleType
        self.factory = factory
    }

    func start() -> UIViewController {
        let module = factory.makeModule(ofType: moduleType)
        let viewController = module.view
        viewController.tabBarItem = moduleType.tabBarItem
        self.module = module
        return viewController
    }
}
