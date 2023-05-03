//
//  HomeView.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import UIKit

class HomeView: UIView {

    private lazy var searchText = searchTextField(placeholderText: "Введите запрос")
    private lazy var searchButton = CustomButton(buttonText: "Сгенерировать", textColor: .white, background: .systemBlue, fontSize: 13, fontWeight: .bold)
    private lazy var imageView = CustomImageView(imageName: "example")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.backgroundColor = .black
        self.addSubview(searchText)
        self.addSubview(searchButton)
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
        
            searchText.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
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
            
        ])
        
    }
}
