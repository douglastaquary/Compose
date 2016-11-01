//
//  TestDetail.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import XCTest
import Compose
@testable import Compose_Example

class TestDetail: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testExample() {
        var state = DetailViewState(photos: [], rooms: 0, area: 0, parkingSpaces: 0, bathrooms: 0, desc: nil, descriptionExpanded: false)
        var units = ComposeDetailView(with: state, expandCallback: {})
        XCTAssert(units.count == 4)
        state.description = "Uhuuu"
        units = ComposeDetailView(with: state, expandCallback: {})
        XCTAssert(units.count == 7)
        state.descriptionExpanded = true
        units = ComposeDetailView(with: state, expandCallback: {})
        XCTAssert(units.count == 6)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
