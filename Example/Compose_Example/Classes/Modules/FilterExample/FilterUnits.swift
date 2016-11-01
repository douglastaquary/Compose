//
//  FilterUnits.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

struct FilterUnits {

    static func TextEntryUnit(entry: FilterEntry)-> ComposingUnit {
        return TextUnit(id: entry.name, text: entry.name, going: entry.going)
    }
    
    static func EmptyUnit()-> ComposingUnit {
        return TextUnit(id: "emptyList", text: "No developer found", minHeight: 140)
    }
    
}
