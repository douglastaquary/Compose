//
//  UIViewExtensionTests.swift
//  ComposingBlocks
//
//  Created by Bruno Bilescky on 05/10/16.
//  Copyright © 2016 bgondim. All rights reserved.
//

import XCTest
@testable import Compose

class UIViewExtensionTests: XCTestCase {
    
    func testNofFoundNib() {
        let nib = UIView.nibForSelf()
        XCTAssert(nib == nil)
    }
    
    func testFoundNib() {
        let nib = DummyNibView.nibForSelf()
        XCTAssert(nib != nil)
    }
    
    func testShortClassName() {
        let uiViewName = shortName(for: UIView.self)
        XCTAssert(uiViewName == "UIView")
    }
    
    
}
