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
    
    private func setupView(){
        self.contentView.layer.cornerRadius = 15
        self.contentView.backgroundColor = .
        
    }
}
