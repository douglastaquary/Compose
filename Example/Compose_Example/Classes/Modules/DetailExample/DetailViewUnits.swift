//
//  DetailViewUnits.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

struct DetailViewUnits {
    
    static func HeaderUnit()-> ComposingUnit {
        return EmptyViewUnit(id: "header", color: .red, height: DimensionUnit(widthPercent: 9.0/16.0))
    }
    
    static func SpacerUnit(id: String, height: Int)-> ComposingUnit {
        return EmptyViewUnit(id: id, height: DimensionUnit(height))
    }
    
    static func DescriptionUnit(text: String, expanded: Bool)-> ComposingUnit {
        return LabelUnit(id: "description", text: text, font: UIFont.systemFont(ofSize: 14, weight: UIFontWeightLight), color: .gray, backgroundColor: .clear, maxHeight: expanded ? nil : 160)
    }
    
    static func HeaderDescriptionUnit(header: String)-> ComposingUnit {
        return LabelUnit(id: "description-header", text: header, font: UIFont.systemFont(ofSize: 18, weight: UIFontWeightMedium), color: .darkGray, backgroundColor: .clear)
    }
    
    static func ExpandDescriptionUnit(callback:@escaping ()->Void)-> ComposingUnit {
        return ExpandUnit(identifier: "expand-desc", text: "Leia mais", color: .blue, backgroundColor: .clear, font: UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular), textAlignment: .right, heightUnit: 40, callback: callback)
    }
    
    static func PhotosUnit(colors: [UIColor])-> ComposingUnit {
        var index = 0
        let photoUnits: [ComposingUnit] = colors.map { color in
            let unit = EmptyViewUnit(id: "photo\(index)", color: color, width: DimensionUnit(heightPercent: 2.0))
            index += 1
            return unit
        }
        let unit = CollectionStackUnit(identifier:"photos", direction: .horizontal, traits: [.height(100)], units: photoUnits) { collectionView in
            collectionView.sectionInset = UIEdgeInsets(8)
            collectionView.itemSpace = 16
            collectionView.lineSpace = 16
        }
        return unit
    }
    
    static func DetailInfoUnit(with state:DetailViewState)-> ComposingUnit {
        let itemWidthUnit = DimensionUnit(widthPercent: 0.25)
        let areaUnit = DetailItemUnit(identifier: "area", value: state.area, title: "Area", widthUnit: itemWidthUnit)
        let roomsUnit = DetailItemUnit(identifier: "rooms", value: state.numberOfRooms, title: "Quartos", widthUnit: itemWidthUnit)
        let bathRoomsUnit = DetailItemUnit(identifier: "bathrooms", value: state.numberOfBathrooms, title: "Banheiros", widthUnit: itemWidthUnit)
        let parkingSpacesUnit = DetailItemUnit(identifier: "parkingSpace", value: state.numberOfParkingSpaces, title: "Vagas", widthUnit: itemWidthUnit)
        return CollectionStackUnit(identifier:"details", direction: .horizontal, traits: [.height(80)], units: [areaUnit, roomsUnit, bathRoomsUnit, parkingSpacesUnit])
    }
    
}

