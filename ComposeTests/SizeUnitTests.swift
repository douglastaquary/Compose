//
//  DimensionTests.swift
//  ComposingBlocks
//
//  Created by Bruno Bilescky on 04/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import XCTest
@testable import Compose

class DimensionTests: XCTestCase {
    
    let size = CGSize(width: 200.0, height: 100.0)
    
    func testIntegerDimension() {
        let dimension = DimensionUnit(40)
        XCTAssert(dimension.value(for: size) == 40.0)
    }
    
    func testConvertIntToDimension() {
        let dimension: DimensionUnit = 40
        XCTAssert(dimension.value(for: size) == 40.0)
    }
    
    func testInitWithFloat() {
        let dimension = DimensionUnit(Float(40.0))
        XCTAssert(dimension.value(for: size) == 40.0)
    }
    
    func testConvertFloatToDimension() {
        let dimension: DimensionUnit = 40.0
        XCTAssert(dimension.value(for: size) == 40.0)
    }
    
    func testHeightPercentual() {
        let dimension = DimensionUnit(heightPercent: 0.5)
        XCTAssert(dimension.value(for: size) == 50.0)
    }
    
    func testWidthPercentual() {
        let dimension = DimensionUnit(widthPercent: 0.5)
        XCTAssert(dimension.value(for: size) == 100.0)
    }
    
    func testHeightReductor() {
        let dimension = DimensionUnit(minusHeight: 50)
        XCTAssert(dimension.value(for: size) == 50.0)
    }
    
    func testWidthReductor() {
        let dimension = DimensionUnit(minusWidth: 100)
        XCTAssert(dimension.value(for: size) == 100.0)
    }
    
    func testCustomSize() {
        let dimension = DimensionUnit { size in
            return size.width + size.height
        }
        XCTAssert(dimension.value(for: size) == 300.0)
    }
    
    
}
