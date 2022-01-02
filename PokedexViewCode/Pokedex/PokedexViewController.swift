//
//  PokedexViewController.swift
//  PokedexViewCode
//
//  Created by Felipe Forcinetti on 20/12/21.
//

import UIKit

class PokedexViewController: UIViewController {
    
    var pokedexView: PokedexView?
    
    var pokedex: [PokedexViewModel] = [PokedexViewModel(number: "#001", name: "Bulbassauro", image: "001" , type: "Grass"),
                                       PokedexViewModel(number: "#002", name: "Charmander", image: "004", type: "Fire"),
    ]
    
    override func loadView() {
        self.pokedexView = PokedexView()
        self.view = pokedexView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        pokedexView?.configCollectionViewProtocols(delegate: self, dataSource: self)
        
    }

}

extension PokedexViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokedex.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokedexCollectionViewCell.indentifier, for: indexPath) as? PokedexCollectionViewCell
        
        cell?.setupCell(data: self.pokedex[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 180, height: 135)
    }

}
