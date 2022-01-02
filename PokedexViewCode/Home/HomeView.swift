//
//  HomeView.swift
//  PokedexViewCode
//
//  Created by Felipe Forcinetti on 13/12/21.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func tappedButton()
}

protocol ModifyScreenDelegate: AnyObject {
    func timerScreen()
}

class HomeView: UIView, ConfigViewProtocol {
    
    weak var delegate: HomeViewProtocol?
    
    weak var modifyScreenDelegate: ModifyScreenDelegate?
  
    var viewModel: HomeViewModel?
    
    lazy var titleImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pokemonLogo")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    lazy var circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        
        return view
    }()
    
    lazy var pokemonImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Pikachu")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 32/255, green: 168/255, blue: 215/255, alpha: 1)
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 28)
        button.layer.cornerRadius = 33
        button.addTarget(self, action: #selector(self.tappedButton), for: .touchUpInside)
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        apllyViewCode()
        configCornerRadius()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedButton() {
        self.delegate?.tappedButton()
    }
    
    func configModifyScreenDelegate(delegate: ModifyScreenDelegate?) {
        self.modifyScreenDelegate = delegate
        startModifierFunctions()
    }
    
    func startModifierFunctions() {
        modifyScreenDelegate?.timerScreen()
    }
    
    func aditionalConfigs() {
        self.backgroundColor = UIColor(red: 244/255, green: 245/255, blue: 82/255, alpha: 1)
    }
    
    public func configCornerRadius() {
        self.circleView.layer.cornerRadius = self.circleView.frame.height / 2
        self.pokemonImageView.layer.cornerRadius = self.pokemonImageView.frame.height / 2
        self.pokemonImageView.clipsToBounds = true
    }
    
    func buildHierarchy() {
        addSubview(self.titleImageView)
        addSubview(self.circleView)
        addSubview(self.pokemonImageView)
        addSubview(self.loginButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleImageView.topAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.titleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            self.titleImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            
            self.circleView.topAnchor.constraint(equalTo: self.titleImageView.bottomAnchor, constant: 25),
            self.circleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.circleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.circleView.heightAnchor.constraint(equalTo: self.circleView.widthAnchor),
            
            self.pokemonImageView.topAnchor.constraint(equalTo: self.circleView.topAnchor, constant: 55),
            self.pokemonImageView.leadingAnchor.constraint(equalTo: self.circleView.leadingAnchor, constant: 55),
            self.pokemonImageView.trailingAnchor.constraint(equalTo: self.circleView.trailingAnchor, constant: -55),
            self.pokemonImageView.bottomAnchor.constraint(equalTo: self.circleView.bottomAnchor, constant: -55),

            self.loginButton.topAnchor.constraint(greaterThanOrEqualTo: self.circleView.bottomAnchor, constant: 20),
            self.loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 34),
            self.loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -34),
            self.loginButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            self.loginButton.heightAnchor.constraint(equalToConstant: 74),
            
        ])
    }
}

