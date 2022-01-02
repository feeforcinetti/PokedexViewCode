//
//  PokedexView.swift
//  PokedexViewCode
//
//  Created by Felipe Forcinetti on 20/12/21.
//

import UIKit

class PokedexView: UIView, ConfigViewProtocol {
    
    lazy var collectionView : UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.register(PokedexCollectionViewCell.self, forCellWithReuseIdentifier: PokedexCollectionViewCell.indentifier)
        collection.backgroundColor = .darkGray
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        collection.setCollectionViewLayout(layout, animated: false)
        return collection
            
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        apllyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        addSubview(self.collectionView)
    }
    
    func configCollectionViewProtocols(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = dataSource
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 150),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -22),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
}
