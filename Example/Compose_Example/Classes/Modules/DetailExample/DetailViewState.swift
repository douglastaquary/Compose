//
//  DetailViewState.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

struct DetailViewState {

    var photos: [UIColor]
    
    var numberOfRooms: Int
    var area: Int
    var numberOfParkingSpaces: Int
    var numberOfBathrooms: Int
    var description: String? {
        didSet {
            if description == nil {
                descriptionExpanded = false
            }
        }
    }
    
    var descriptionExpanded: Bool
    
    init(photos: [UIColor] = randomColors(maxColors: 15), rooms: Int = 0, area: Int = 0, parkingSpaces: Int = 0, bathrooms: Int = 0, desc: String? = nil, descriptionExpanded: Bool = false) {
        self.descriptionExpanded  = descriptionExpanded
        self.photos = photos
        self.numberOfRooms = rooms
        self.area = area
        self.numberOfParkingSpaces = parkingSpaces
        self.numberOfBathrooms = bathrooms
        self.description = desc
    }
    
}
