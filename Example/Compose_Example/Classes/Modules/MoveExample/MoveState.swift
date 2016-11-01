//
//  MoveState.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

struct MoveState {

    var colors: [(String, UIColor)]
    
    init(colors:[(String, UIColor)] = [("red",.red), ("green",.green), ("blue",.blue), ("magenta",.cyan)]) {
        self.colors = colors
    }
    
}
