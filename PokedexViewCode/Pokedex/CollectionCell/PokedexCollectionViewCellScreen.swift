//
//  PokedexCollectionViewCell.swift
//  PokedexViewCode
//
//  Created by Felipe Forcinetti on 20/12/21.
//

import UIKit

class PokedexCollectionViewCellScreen: UIView, ConfigViewProtocol {
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "#001"
        label.textColor = .darkGray
        label.font = UIFont(name: "Helvetica-Bold", size: 12)
        return label
    }()
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bulbassauro"
        label.textColor = .white
        label.font = UIFont(name: "Helvetica-Bold", size: 19)
        label.contentMode = .left
        return label
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        label.text = "grass"
        label.textColor = .white
        label.font = UIFont(name: "Helvetica-Bold", size: 10)
        label.contentMode = .center
        return label
    }()
    
    lazy var pokeballImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "unnamed")
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.80)
        return image
    }()
    
    lazy var pokemonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "001")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.buildHierarchy()
        self.setupConstraints()
        self.configBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configBackgroundColor() {
        self.backgroundColor = UIColor(red: 72/255, green: 208/255, blue: 175/255, alpha: 1)
    }
    
    func buildHierarchy() {
        addSubview(self.numberLabel)
        addSubview(self.nameLabel)
        addSubview(self.typeLabel)
        addSubview(self.pokeballImage)
        addSubview(self.pokemonImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            numberLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 12),
            numberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            nameLabel.topAnchor.constraint(equalTo: self.numberLabel.bottomAnchor, constant: 2),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 12),
            
            pokeballImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 40),
            pokeballImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20),
            pokeballImage.heightAnchor.constraint(equalToConstant: 91),
            pokeballImage.widthAnchor.constraint(equalToConstant: 123),
            
            pokemonImage.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor),
            pokemonImage.leadingAnchor.constraint(greaterThanOrEqualTo: self.typeLabel.trailingAnchor, constant: 8),
            pokemonImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            pokemonImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            typeLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10),
            typeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
        ])
    }
}
