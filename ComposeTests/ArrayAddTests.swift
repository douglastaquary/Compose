//
//  ArrayAddTests.swift
//  ComposingBlocks
//
//  Created by Bruno Bilescky on 04/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import XCTest
@testable import Compose

class ArrayAddTests: XCTestCase {

    var items: [String] = []
    
    override func setUp() {
        super.setUp()
        items = []
    }
    
    func testAddIf() {
        var condition = false
        items.add(if: condition) {
            XCTFail("condition is false")
            return "value"
        }
        XCTAssert(items.count == 0)
        condition = true
        items.add(if: condition) {  return "value" }
        XCTAssert(items.count == 1)
        XCTAssert(items[0] == "value")
    }
    
    func testAddIfLet() {
        var value: String? = nil
        items.add(ifLet: value) { value in
            XCTFail("value is nill")
            return value
        }
        XCTAssert(items.count == 0)
        value = "value"
        items.add(ifLet: value) { value in
            return value
        }
        XCTAssert(items.count == 1)
        XCTAssert(items[0] == "value")
    }
    
    func testAddIfLetElse() {
        var value: String? = nil
        items.add(ifLet: value, item: { _ in
            XCTFail("value is nil"); return ""
        }) { return "first"  }
        XCTAssert(items.count == 1)
        XCTAssert(items[0] == "first")
        value = "value"
        items.add(ifLet: value, item: { $0 }) {
            XCTFail("value is not nil"); return "first"
        }
        XCTAssert(items.count == 2)
        XCTAssert(items[1] == value)
    }
    
    func testAddIfElse() {
        var condition = false
        items.add(ifTrue: condition, itemTrue: {
            XCTFail("condition is false"); return ""
        }) { return "first" }
        XCTAssert(items.count == 1)
        XCTAssert(items[0] == "first")
        condition = true
        items.add(ifTrue: condition, itemTrue: { return "second" }) {
            XCTFail("condition is false"); return ""
        }
        XCTAssert(items.count == 2)
        XCTAssert(items[1] == "second")
    }
    
    func testAddMany() {
        items.add {
            return ["first", "second"]
        }
        XCTAssert(items.count == 2)
        XCTAssert(items[0] == "first")
        XCTAssert(items[1] == "second")
    }
    
    func testAddManyIf() {
        var condition = false
        items.add(manyIf: condition) {
            XCTFail("condition is false")
            return []
        }
        XCTAssert(items.count == 0)
        condition = true
        items.add(manyIf: condition) {
            return ["first", "second"]
        }
        XCTAssert(items.count == 2)
        XCTAssert(items[0] == "first")
        XCTAssert(items[1] == "second")
    }
    
    func testAddManyIfLet() {
        var value: String? = nil
        items.add(manyIfLet: value) { value in
            XCTFail("value is nil")
            return []
        }
        XCTAssert(items.count == 0)
        value = "first,second"
        items.add(manyIfLet: value) { value in
            return value.components(separatedBy: ",")
        }
        XCTAssert(items.count == 2)
        XCTAssert(items[0] == "first")
        XCTAssert(items[1] == "second")
    }
    
    func testAddManyIfTrue() {
        var condition = false
        items.add(manyIfTrue: condition, itemsTrue: {
            XCTFail("condition is false")
            return []
        }) {
            return ["first", "second"]
        }
        XCTAssert(items.count == 2)
        condition = true
        items.add(manyIfTrue: condition, itemsTrue: {
            return ["third","fourth"]
        }) {
            XCTFail("condition is true")
            return []
        }
        XCTAssert(items.count == 4)
        XCTAssert(items[1] == "second")
        XCTAssert(items[3] == "fourth")
    }
    
}
