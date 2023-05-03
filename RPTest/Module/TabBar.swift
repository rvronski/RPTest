//
//  TabBar.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import UIKit

final class AppTabBarController: UITabBarController {
    init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
        setupTabBar()
    }
    private var layerHeight = CGFloat()
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupTabBar() {
        let layer = CAShapeLayer()
        
        let x: CGFloat = 10
        let y: CGFloat = 20
        
        let width = self.tabBar.bounds.width - x * 2
        let height = self.tabBar.bounds.height + y * 1.5
        layerHeight = height
        layer.fillColor = UIColor.darkGray.cgColor
        layer.path = UIBezierPath(roundedRect: CGRect(x: x,
                                              y: self.tabBar.bounds.minY - y,
                                              width: width,
                                              height: height),
                                  cornerRadius: height / 2).cgPath
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1
        
        self.tabBar.layer.insertSublayer(layer, at: 0)
        self.tabBar.tintColor = .orange
        self.tabBar.itemWidth = width/6
        self.tabBar.unselectedItemTintColor = .lightGray
        
    }

}
