//
//  Module.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import UIKit

protocol ViewModelProtocol: AnyObject {}

struct Module {
    
    enum ModuleType {
        case home
        case like
    }
    
    let moduleType: ModuleType
    let viewModel: ViewModelProtocol
    let view: UIViewController
    
}
extension Module.ModuleType {
    var tabBarItem: UITabBarItem {
        switch self {
        case .home:
            return UITabBarItem(title: nil,image: UIImage(systemName: "house"), tag: 0)
        case .like:
            return UITabBarItem(title: nil,image: UIImage(systemName: "heart"), tag: 1)
        }
    }
}
