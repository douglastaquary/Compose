//
//  LargeCollectionInsideView.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 26/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

class LargeCollectionInsideView: CollectionStackView {

    var viewState: LargeCollectionInsideViewState = LargeCollectionInsideViewState() {
        didSet {
            print("\(viewState.upperColors.count) | \(viewState.insideColors.count) | \(viewState.bottomColors.count)")
            self.container.state = ComposeLargeCollectionInsideView(with: viewState)
        }
    }
    
    

}


func ComposeLargeCollectionInsideView(with state: LargeCollectionInsideViewState)-> [ComposingUnit] {
    LargeCollectionInsideViewUnits.resetCount()
    var units: [ComposingUnit] = []
    units.add {
        return state.upperColors.map { LargeCollectionInsideViewUnits.ColorUnit(color: $0) }
    }
    units.add(if: units.count > 0 && state.insideColors.count > 0) {
        return LargeCollectionInsideViewUnits.SpacerUnit(id: "upper-separator")
    }
    units.add(if: state.insideColors.count > 0) {
        return LargeCollectionInsideViewUnits.InsideListUnit(with: state.insideColors)
    }
    units.add(if: units.count > 0 && state.bottomColors.count > 0) {
        return LargeCollectionInsideViewUnits.SpacerUnit(id: "bottom-separator")
    }
    units.add {
        return state.bottomColors.map { LargeCollectionInsideViewUnits.ColorUnit(color: $0) }
    }
    return units
}
