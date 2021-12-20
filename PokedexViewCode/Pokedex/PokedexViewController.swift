//
//  PokedexViewController.swift
//  PokedexViewCode
//
//  Created by Felipe Forcinetti on 20/12/21.
//

import UIKit

class PokedexViewController: UIViewController {
    
    var pokedexView: PokedexView?
    
    override func loadView() {
        self.pokedexView = PokedexView()
        self.view = pokedexView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }

}
