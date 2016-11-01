//
//  ExpandUnit.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

struct ExpandUnit: SelectableUnit {

    typealias Cell = ComposingUnitCollectionViewCell<UILabel>
    
    let identifier: String
    let text: String
    let color: UIColor
    let backgroundColor: UIColor
    let font: UIFont
    let textAlignment: NSTextAlignment
    let heightUnit: DimensionUnit
    let callback: (()-> Void)
    
    func configure(view: UIView) {
        guard let cell = view as? Cell else { return }
        cell.insets = UIEdgeInsets(horizontal: 16)
        cell.innerView.text = text
        cell.innerView.textAlignment = textAlignment
        cell.innerView.font = font
        cell.innerView.textColor = color
        cell.innerView.backgroundColor = backgroundColor
    }
    
    func didSelect() {
        callback()
    }
    
    func reuseIdentifier() -> String {
        return Cell.identifier()
    }
    
    func register(in collectionView: UICollectionView) {
        Cell.register(in: collectionView)
    }
    
}
