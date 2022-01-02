//
//  PokedexCollectionViewCell.swift
//  PokedexViewCode
//
//  Created by Felipe Forcinetti on 22/12/21.
//

import UIKit

class PokedexCollectionViewCell: UICollectionViewCell {
    
    static let indentifier: String = "PokedexCollectionViewCell"
    
    let pokedexCollectionViewCellScreen: PokedexCollectionViewCellScreen = PokedexCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(data: PokedexViewModel) {
        self.pokedexCollectionViewCellScreen.nameLabel.text = data.name
        self.pokedexCollectionViewCellScreen.pokemonImage.image = UIImage(named: data.image)
        self.pokedexCollectionViewCellScreen.numberLabel.text = data.number
        self.pokedexCollectionViewCellScreen.typeLabel.text = data.type
    }
    
    func buildHierarchy() {
        pokedexCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.pokedexCollectionViewCellScreen)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.pokedexCollectionViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.pokedexCollectionViewCellScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.pokedexCollectionViewCellScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.pokedexCollectionViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
        ])
    }
    
}
