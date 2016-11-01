//
//  EmptyViewUnit.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

struct EmptyViewUnit: ComposingUnit {

    let identifier: String
    let backgroundColor: UIColor
    var heightUnit: DimensionUnit
    var widthUnit: DimensionUnit
    
    init(id: String, color: UIColor = .clear, height: DimensionUnit = 1, width: DimensionUnit = 1) {
        self.identifier = id
        self.backgroundColor = color
        self.heightUnit = height
        self.widthUnit = width
    }
    
    func configure(view: UIView) {
        view.backgroundColor = backgroundColor
    }
    
    func reuseIdentifier() -> String {
        return "EmptyViewUnit"
    }
    
    func register(in tableView: UITableView) {
        UITableViewCell.register(in: tableView, customIdentifier: reuseIdentifier())
    }
    
    func register(in collectionView: UICollectionView) {
        UICollectionViewCell.register(in: collectionView, customIdentifier: reuseIdentifier())
    }
    
}
