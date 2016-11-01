//
//  FilterState.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

struct FilterState {

    enum Status: Int {
        case going, notGoing
        
        var filterByGoing: Bool {
            return self == .going
        }
    }
    
    var filterText: String = ""
    var filterGoing: Status? = nil
    
    var filteredData: [FilterEntry] {
        return FilterData.filteredData(by: filterText, going: filterGoing?.filterByGoing)
    }
    
}
