//
//  LikeCollectionViewCell.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 03.05.2023.
//

import UIKit

protocol LikeCollectionDelegate: AnyObject {
    func deleteLike(likeNumber: Int)
}

class LikeCollectionViewCell: UICollectionViewCell {
    static let identifire = "likeCell"
    var delegate: LikeCollectionDelegate?
    private lazy var likeNumber = Int()
    private lazy var imageView = CustomImageView(imageName: "")
    private lazy var searchTextLabel = InfoLabels(inform: "", size: 15, weight: .bold, color: .white)
    private lazy var trashButton = TrashButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        trashButton.tapButton = { [weak self] in
            guard let likeNumber = self?.likeNumber else {return}
            self?.delegate?.deleteLike(likeNumber: likeNumber)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    func setup(model: Like, likeNumber: Int) {
        guard let data = model.image,
              let text = model.text
        else {return}
        self.likeNumber = likeNumber
        self.imageView.image = UIImage(data: data)
        self.searchTextLabel.text = text
    }
    
    private func setupView(){
        self.contentView.layer.cornerRadius = 15
        self.contentView.backgroundColor = .darkGray
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(searchTextLabel)
        self.contentView.addSubview(trashButton)
        
        imageView.layer.cornerRadius = 10

        NSLayoutConstraint.activate([
        
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            self.imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor),
            
            self.searchTextLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.searchTextLabel.leftAnchor.constraint(equalTo: self.imageView.rightAnchor, constant: 20),
            self.searchTextLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            
            self.trashButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            self.trashButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            
        
        
        
        ])
        
    }
}
