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
    
    private lazy var homeView: HomeView = {
       let view = HomeView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension HomeViewController: HomeViewDelegate {
    
    func saveLike(searchText: String, image: Data) {
        viewModel.createLike(text: searchText, image: image)
    }
    
    func showAlert() {
        self.alertOk(title: "Введите запрос", message: nil)
    }
    
    func getImage(searchText: String) {
        viewModel.getImage(searchText: searchText) { [weak self] data in
            DispatchQueue.main.async {
                self?.homeView.imageView.image = UIImage(data: data)
                self?.homeView.activityIndicator.isHidden = true
                self?.homeView.activityIndicator.stopAnimating()
            }
           
        }
    }
    
    
}
