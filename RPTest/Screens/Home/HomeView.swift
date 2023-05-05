//
//  HomeView.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import UIKit
protocol HomeViewDelegate: AnyObject {
    func hideKeyboard()
    func showAlert()
    func getImage(searchText: String)
    func saveLike(searchText: String, image: Data)
}
class HomeView: UIView {

    private lazy var searchText = searchTextField(placeholderText: "Введите запрос")
    private lazy var searchButton = CustomButton(buttonText: "Сгенерировать", textColor: .white, background: .systemBlue, fontSize: 13, fontWeight: .bold)
    lazy var imageView = CustomImageView(imageName: "example")
    private lazy var likeButton = LikeButton()
    var saveSearchText: String? {
        didSet {
            self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    lazy var activityIndicator: UIActivityIndicatorView = {
       let activityIndicator = UIActivityIndicatorView(style: .large)
       activityIndicator.translatesAutoresizingMaskIntoConstraints = false
       activityIndicator.color = .darkGray
       return activityIndicator
   }()
    
    var delegate: HomeViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        searchButton.tapButton = { [weak self] in
            self?.delegate?.hideKeyboard()
            guard let searchText = self?.searchText.text, !searchText.isEmpty
            else { self?.delegate?.showAlert()
                return }
            self?.saveSearchText = searchText
            self?.activityIndicator.isHidden = false
            self?.activityIndicator.startAnimating()
            self?.delegate?.getImage(searchText: searchText)
        }
        
        likeButton.tapButton = { [weak self] in
            guard let saveSearchText = self?.saveSearchText, !saveSearchText.isEmpty
            else { self?.delegate?.showAlert()
                return }
            self?.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            self?.delegate?.saveLike(searchText: saveSearchText, image: (self?.imageView.image?.pngData())!)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   
    
    private func setupView() {
        self.backgroundColor = .white
        self.addSubview(searchText)
        self.addSubview(searchButton)
        self.addSubview(imageView)
        self.addSubview(activityIndicator)
        self.addSubview(likeButton)
        searchText.layer.borderWidth = 0.1
        searchText.accessibilityIdentifier = "SearchTF"
        searchButton.accessibilityIdentifier = "SearchButton"
        NSLayoutConstraint.activate([
        
            searchText.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            searchText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            searchText.heightAnchor.constraint(equalTo: searchText.widthAnchor, multiplier: 0.1),
            
            searchButton.topAnchor.constraint(equalTo: self.searchText.bottomAnchor, constant: 16),
            searchButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            searchButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            searchButton.heightAnchor.constraint(equalTo: searchButton.widthAnchor, multiplier: 0.1),
            
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageView.heightAnchor.constraint(equalTo: searchButton.widthAnchor),
            
            likeButton.topAnchor.constraint(equalTo: self.imageView.topAnchor, constant: 20),
            likeButton.rightAnchor.constraint(equalTo: self.imageView.rightAnchor, constant: -20),
            
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
        ])
        
    }
}
