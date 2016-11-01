//
//  MultipleColumnView.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

class MultipleColumnView: CollectionStackView {

    var viewState = MultipleColumnViewState() {
        didSet {
            self.updateDirection()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.container.sectionInset = UIEdgeInsets(16)
        self.container.itemSpace = 16.0
        self.container.lineSpace = 16.0
    }
    
    private func updateDirection() {
        let direction: ComposingContainerDirection = viewState.isVertical ? .verticalGrid(columns: viewState.numberOfItems) : .horizontalGrid(rows: viewState.numberOfItems)
        self.container.direction = direction
    }
    
}
