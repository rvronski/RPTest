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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(homeView)
        
        NSLayoutConstraint.activate([
            
            self.homeView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.homeView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.homeView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.homeView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            
        ])
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
            guard let data else { self?.homeView.activityIndicator.isHidden = true
                self?.homeView.activityIndicator.stopAnimating()
                self?.alertOk(title: "Ошибка", message: nil)
                return
            }
            DispatchQueue.main.async {
                self?.homeView.imageView.image = UIImage(data: data)
                self?.homeView.activityIndicator.isHidden = true
                self?.homeView.activityIndicator.stopAnimating()
            }
            
        }
    }
    
    
}
