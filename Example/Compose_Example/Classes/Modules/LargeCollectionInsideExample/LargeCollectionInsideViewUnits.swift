//
//  LargeCollectionInsideViewUnits.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 26/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

struct LargeCollectionInsideViewUnits {

    private static var ColorCounter: Int = 0
    
    static func resetCount() {
        ColorCounter = 0
    }
    
    static func ColorUnit(color: UIColor)-> ComposingUnit {
        ColorCounter += 1
        return EmptyViewUnit(id: "\(ColorCounter)\(color.hashValue)", color: color, height: 23)
    }
    
    static func SpacerUnit(id: String)-> ComposingUnit {
        return EmptyViewUnit(id: id, color: UIColor.clear, height: DimensionUnit(100))
    }
    
    static func InsideListUnit(with colors:[UIColor])-> ComposingUnit {
        let units: [ComposingUnit] = colors.lazy.map { ColorUnit(color: $0) }
        return CollectionStackUnit(identifier: "insideItems", traits: [], units: units)
    }
    
}
