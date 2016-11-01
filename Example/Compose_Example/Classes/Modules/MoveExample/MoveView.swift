//
//  MoveView.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

@IBDesignable
class MoveView: CollectionStackView {

    var viewState = MoveState() {
        didSet {
            self.updateWith(state: self.stateUnits)
        }
    }
    
    func stateUnits()-> [ComposingUnit] {
        let heightPercent = 1.0 / Float(viewState.colors.count)
        let units = viewState.colors.map { return EmptyViewUnit(id: $0.0, color: $0.1, height: DimensionUnit(heightPercent: heightPercent)) }
        return units
    }

}
