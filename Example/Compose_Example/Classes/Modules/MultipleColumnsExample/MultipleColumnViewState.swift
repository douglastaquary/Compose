//
//  MultipleColumnViewState.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

struct MultipleColumnViewState {

    var numberOfItems: Int
    var isVertical: Bool
    
    init(numberOfItems: Int = 1, vertical: Bool = true) {
        self.numberOfItems = numberOfItems
        self.isVertical = vertical
    }
    
}
