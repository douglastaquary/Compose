//
//  ViewTraitsTests.swift
//  ComposingBlocks
//
//  Created by Bruno Bilescky on 05/10/16.
//  Copyright © 2016 bgondim. All rights reserved.
//

import XCTest
@testable import Compose

class ViewTraitsTests: XCTestCase {
    
    
    func testMapTraits() {
        let background = ViewTraits.backgroundColor(.red)
        let insets = ViewTraits.insets(UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        let height = ViewTraits.height(10)
        let width = ViewTraits.width(10)
        let opaque = ViewTraits.opaque(true)
        let traits: [ViewTraits] = [background, insets, height, width, opaque]
        let style = ViewTraits.mapStyle(from: traits)
        let dimensions = ViewTraits.mapDimensionUnits(from: traits)
        
        XCTAssert(style.backgroundColor == UIColor.red)
        XCTAssert(style.opaque == true)
        XCTAssert(style.insets.top == 10)
        
        XCTAssert(dimensions.height.value(for: .zero) == 10)
        XCTAssert(dimensions.width.value(for: .zero) == 10)
    }
    
    
}
