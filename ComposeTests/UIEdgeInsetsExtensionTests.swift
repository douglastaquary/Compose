//
//  UIEdgeInsetsExtensionTests.swift
//  ComposingBlocks
//
//  Created by Bruno Bilescky on 05/10/16.
//  Copyright © 2016 bgondim. All rights reserved.
//

import XCTest
@testable import Compose

class UIEdgeInsetsExtensionTests: XCTestCase {
    
    func testInitWithDefaultValuesFilled() {
        let insets = UIEdgeInsets(top: 0, leading: 1, bottom: 2, trailing: 3)
        XCTAssert(insets.top == 0)
        XCTAssert(insets.left == 1)
        XCTAssert(insets.bottom == 2)
        XCTAssert(insets.right == 3)
    }
    
    func testInitWithDefaultValues() {
        let insets = UIEdgeInsets()
        XCTAssert(insets.top == 0)
        XCTAssert(insets.left == 0)
        XCTAssert(insets.bottom == 0)
        XCTAssert(insets.right == 0)
    }
    
    func testInitHorizontal() {
        let insets = UIEdgeInsets(horizontal: 10)
        XCTAssert(insets.left == 10)
        XCTAssert(insets.right == 10)
        XCTAssert(insets.top == 0 && insets.bottom == 0)
    }
    
    func testInitVertical() {
        let insets = UIEdgeInsets(vertical: 10)
        XCTAssert(insets.top == 10)
        XCTAssert(insets.bottom == 10)
        XCTAssert(insets.left == 0 && insets.right == 0)
    }
    
    func testInitAllValues() {
        let insets = UIEdgeInsets(10)
        XCTAssert(insets.top == 10)
        XCTAssert(insets.left == 10)
        XCTAssert(insets.bottom == 10)
        XCTAssert(insets.right == 10)
    }
    
    func testHorizontalInsets() {
        let insets = UIEdgeInsets(horizontal: 10)
        XCTAssert(insets.horizontalInsets == 20)
    }
    
    func testVerticalInsets() {
        let insets = UIEdgeInsets(vertical: 10)
        XCTAssert(insets.verticalInsets == 20)
    }
    
}
