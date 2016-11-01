//
//  SelectExamplesUnits.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

struct SelectExamplesUnits {

    static func FilterUnit(onSelect: @escaping ((ComposingUnit)-> Void))-> ComposingUnit {
        return TextUnit(id: "filter", text: "Filter example", callback: onSelect)
    }
    
    static func LoginUnit(onSelect: @escaping ((ComposingUnit)-> Void))-> ComposingUnit {
        return TextUnit(id: "login", text: "Login example", callback: onSelect)
    }
    
    static func MoveUnit(onSelect: @escaping ((ComposingUnit)-> Void))-> ComposingUnit {
        return TextUnit(id: "move", text: "Move example", callback: onSelect)
    }
    
    static func ColumnsUnit(onSelect: @escaping ((ComposingUnit)-> Void))-> ComposingUnit {
        return TextUnit(id: "columns", text: "Grid example", callback: onSelect)
    }
    
    static func DetailUnit(onSelect: @escaping ((ComposingUnit)-> Void))-> ComposingUnit {
        return TextUnit(id: "detail", text: "Detail example", callback: onSelect)
    }
    
    static func InsideCollectionUnit(onSelect: @escaping ((ComposingUnit)-> Void))-> ComposingUnit {
        return TextUnit(id: "insideCollection", text: "Collection Inside Collection example", callback: onSelect)
    }
    
    
    static func allUnits(callback: @escaping ((ComposingUnit)-> Void))-> [ComposingUnit] {
        let filter = FilterUnit(onSelect: callback)
        let login = LoginUnit(onSelect: callback)
        let move = MoveUnit(onSelect: callback)
        let column = ColumnsUnit(onSelect: callback)
        let detail = DetailUnit(onSelect: callback)
        let inside = InsideCollectionUnit(onSelect: callback)
        return [filter, login, move, column, detail, inside]
    }
    
}
