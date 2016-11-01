//
//  MultipleColumnViewUnits.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

struct MultipleColumnViewUnits {

    static let height = DimensionUnit(widthPercent: 1.1)
    static let width = DimensionUnit(heightPercent: 0.5)
    
    static func SingleUnit(color: UIColor)-> ComposingUnit {
        let unit = EmptyViewUnit(id: "\(color)", color: color, height: height, width: width)
        return unit
    }
    
}
