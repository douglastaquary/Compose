//
//  DetailItemUnit.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

struct DetailItemUnit: ComposingUnit {

    typealias Cell = DescriptionItemCollectionViewCell
    
    let identifier: String
    let value: Int
    let title: String
    let widthUnit: DimensionUnit
    
    func configure(view: UIView) {
        guard let cell = view as? Cell else { return }
        cell.valueLabel.text = String(describing: value)
        cell.titleLabel.text = title
    }
    func reuseIdentifier() -> String {
        return Cell.identifier()
    }
    
    func register(in collectionView: UICollectionView) {
        Cell.register(in: collectionView)
    }
}
