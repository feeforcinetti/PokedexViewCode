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
//        collection.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
        collection.backgroundColor = .red
       
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
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 150),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        
        
        ])
    }
    
}
