//
//  HomeViewController.swift
//  PokedexViewCode
//
//  Created by Felipe Forcinetti on 13/12/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView?
    var homeViewModel: HomeViewModel?
    
    var pokemonScreen = [HomeViewModel(backgroundColor: .systemBlue, image: UIImage(named: "Squirtle")),
                         HomeViewModel(backgroundColor: .systemOrange, image: UIImage(named: "Charmander")),
                         HomeViewModel(backgroundColor: .systemGreen, image: UIImage(named: "Bulbasaur")),
                         HomeViewModel(backgroundColor: .yellow, image: UIImage(named: "Pikachu"))
    ]
    
    override func loadView() {
        self.homeView = HomeView()
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView?.configModifyScreenDelegate(delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        homeView?.configCornerRadius()
        homeView?.delegate = self
    }

    private func indexRandom() -> Int {
        let randomIndex = Int(arc4random_uniform(UInt32(pokemonScreen.count)))
        return randomIndex
    }
    
    private func modifyScreen(screen: HomeViewModel) {
        homeView?.backgroundColor = screen.backgroundColor
        homeView?.pokemonImageView.image = screen.image
    }
    
    @objc private func changeScreen() {
        self.modifyScreen(screen: pokemonScreen[indexRandom()])
    }
}

extension HomeViewController: HomeViewProtocol {
    func tappedButton() {
        let vc = PokedexViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension HomeViewController: ModifyScreenDelegate {
    func timerScreen() {
        _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.changeScreen), userInfo: nil, repeats: true)
    }
}
