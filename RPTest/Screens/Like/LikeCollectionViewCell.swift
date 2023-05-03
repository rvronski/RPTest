//
//  LikeCollectionViewCell.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import UIKit

class LikeCollectionViewCell: UICollectionViewCell {
    static let identifire = "likeCell"
    
    private lazy var imageView = CustomImageView(imageName: "")
    private lazy var searchTextLabel = InfoLabels(inform: "", size: 15, weight: .bold, color: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(model: Like) {
        guard let data = model.image,
              let text = model.text
        else {return}
        
        self.imageView.image = UIImage(data: data)
        self.searchTextLabel.text = text
    }
    
    private func setupView(){
        self.contentView.layer.cornerRadius = 15
        self.contentView.backgroundColor = .darkGray
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(searchTextLabel)
        
        imageView.layer.cornerRadius = 10

        NSLayoutConstraint.activate([
        
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            self.imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor),
            
            self.searchTextLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.searchTextLabel.leftAnchor.constraint(equalTo: self.imageView.rightAnchor, constant: 20),
            self.searchTextLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            
        
        
        
        ])
        
    }
}
