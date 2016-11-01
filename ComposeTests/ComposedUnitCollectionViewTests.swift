//
//  ComposedUnitCollectionViewTests.swift
//  Compose
//
//  Created by Bruno Bilescky on 07/10/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
@testable import Compose

class ComposedUnitCollectionViewTests: XCTestCase {
    
    func testDirectUpdate() {
        let view = CollectionStackView()
        let simpleUnit = ViewUnit<UIView>(traits: []) { (view) in
            view.backgroundColor = .red
        }
        view.container.state = [simpleUnit]
        XCTAssert(view.container.state.count == 1)
    }
    
    func testIndirectUpdate() {
        let view = CollectionStackView()
        view.updateWith { () -> [ComposingUnit] in
            let simpleUnit = ViewUnit<UIView>(traits: []) { (view) in
                view.backgroundColor = .red
            }
            return [simpleUnit]
        }
        XCTAssert(view.container.state.count == 1)
    }
    
}
