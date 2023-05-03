//
//  AppCoordinator.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import UIKit

final class AppCoordinator: Coordinatable {
    private(set) var coordinators: [Coordinatable] = []

    private let factory: AppFactory

    init(factory: AppFactory) {
        self.factory = factory
    }

    func start() -> UIViewController {
        let homeCoordinator = HomeCoordinator(moduleType: .home, factory: factory)
        let likeCoordinator = LikeCoordinator(moduleType: .like, factory: factory)
        let appTabBarController = AppTabBarController(viewControllers: [
            homeCoordinator.start(),
            likeCoordinator.start()
        ])

        addCoordinator(coordinator: homeCoordinator)
        addCoordinator(coordinator: likeCoordinator)

        return appTabBarController
    }

    func addCoordinator(coordinator: Coordinatable) {
        guard coordinators.contains(where: { $0 === coordinator }) else {
            return
        }
        coordinators.append(coordinator)
    }

    func removeCoordinator() {
        coordinators.removeAll()
    }
    
}

