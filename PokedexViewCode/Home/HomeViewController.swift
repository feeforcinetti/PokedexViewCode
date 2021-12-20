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
    
    override func loadView() {
        self.homeView = HomeView()
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        homeView?.configCornerRadius()
        homeView?.delegate = self
        homeView?.modifyScreenDelegate = self
        modifyScreen(screen: (homeView?.pokemonScreen[indexRandom()])!)
        timerScreen()
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
    
    func indexRandom() -> Int {
        let randomIndex = Int(arc4random_uniform(UInt32(homeView?.pokemonScreen.count ?? 0)))
        return randomIndex
    }
    
    func modifyScreen(screen: HomeViewModel) {
        homeView?.backgroundColor = screen.backgroundColor
        homeView?.pokemonImageView.image = screen.image
    }
    
    @objc func changeScreen() {
        guard let pokemon = homeView?.pokemonScreen else {return}
        self.modifyScreen(screen: pokemon[indexRandom()])
    }
    
   
}
