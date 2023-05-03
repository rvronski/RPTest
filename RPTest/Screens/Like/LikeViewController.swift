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
    
    private var like = [Like]() {
        didSet {
            if self.like.count > 10 {
                let like = self.like[0]
                viewModel.deleteLike(like: like)
                self.like.remove(at: 0)
                self.likeView.collectionView.reloadData()
            }
        }
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
        likeView.configureCollectionView(collectionViewDelegate: self, collectionViewDataSource: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.like = viewModel.getLike()
        likeView.collectionView.reloadData()
    }
    
}
extension LikeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        like.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LikeCollectionViewCell.identifire, for: indexPath) as! LikeCollectionViewCell
        cell.setup(model: like[indexPath.row], likeNumber: indexPath.row)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = (collectionView.frame.width - 32)
        let itemHeigt = (collectionView.frame.height - 80) / 5
        return CGSize(width: itemWidth, height: itemHeigt)
    }
}
extension LikeViewController: LikeCollectionDelegate {
    func deleteLike(likeNumber: Int) {
        let like = like[likeNumber]
        self.like.remove(at: likeNumber)
        viewModel.deleteLike(like: like)
        self.likeView.collectionView.reloadData()
    }
    
    
}
