//
//  ConfigViewProtocol.swift
//  PokedexViewCode
//
//  Created by Felipe Forcinetti on 13/12/21.
//

import Foundation
import UIKit

protocol ConfigViewProtocol: UIView {
    func buildHierarchy()
    func setupConstraints()
    func aditionalConfigs()
}

extension ConfigViewProtocol {
    
    func aditionalConfigs() {}
    
    func apllyViewCode() {
        buildHierarchy()
        setupConstraints()
        aditionalConfigs()
    }
}
