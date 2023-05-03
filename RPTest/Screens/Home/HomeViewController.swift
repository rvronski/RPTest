//
//  ViewController.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import UIKit

class HomeViewController: UIViewController {

    
    var viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

