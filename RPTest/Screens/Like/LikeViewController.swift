//
//  LikeViewController.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import UIKit

class LikeViewController: UIViewController {
    
    var viewModel: LikeViewModelProtocol
    
    init(viewModel: LikeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var likeView: LikeView = {
       let view = LikeView()
        return view
    }()

    override func loadView() {
        super.loadView()
        self.view = likeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
}
