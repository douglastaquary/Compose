//
//  ViewUnitTest.swift
//  ComposingBlocks
//
//  Created by Bruno Bilescky on 05/10/16.
//  Copyright © 2016 bgondim. All rights reserved.
//

import XCTest
@testable import Compose

class ViewUnitTests: XCTestCase {
    
    let sampleIndexPath = IndexPath(item: 0, section: 0)
    private let dataSource = DataSource()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func setUp() {
        super.setUp()
        collectionView.dataSource = dataSource
    }
    
    func testViewUnitAllocation() {
        let background = ViewTraits.backgroundColor(.red)
        let insets = ViewTraits.insets(UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        let height = ViewTraits.height(10)
        let width = ViewTraits.width(10)
        let opaque = ViewTraits.opaque(true)
        let dummyUnit = ViewUnit<UIView>(traits:[background, insets, height, width, opaque])
        XCTAssert(dummyUnit.heightUnit.value(for: .zero) == 10)
        XCTAssert(dummyUnit.widthUnit.value(for: .zero) == 10)
        let view = UIView(frame: .zero)
        dummyUnit.configure(view: view)
        XCTAssert(view.backgroundColor == nil)
    }
    
    func testUIViewConfiguration() {
        let view = UIView(frame: .zero)
        let dummyUnit = ViewUnit<UIView>(traits: []) { (innerView) in
            innerView.backgroundColor = .red
        }
        dummyUnit.configure(view: view)
        XCTAssert(view.backgroundColor == .red)
    }
    
    func testUICollectionViewCellConfiguration() {
        let cell = UICollectionViewCell(frame: .zero)
        let dummyUnit = ViewUnit<UICollectionViewCell>(traits: []) { cell in
            cell.backgroundColor = .red
        }
        dummyUnit.configure(view: cell)
        XCTAssert(cell.backgroundColor == .red)
    }
    
    func testOtherUIViewConfiguration() {
        let background = ViewTraits.backgroundColor(.red)
        let cell = ComposingUnitCollectionViewCell<UILabel>()
        let dummyUnit = ViewUnit<UILabel>(traits:[background]) { label in
            label.backgroundColor = .yellow
        }
        dummyUnit.configure(view: cell)
        XCTAssert(cell.innerView.backgroundColor == .yellow)
        XCTAssert(cell.contentView.backgroundColor == .red)
        XCTAssert(cell.backgroundColor == .clear)
    }
    
    func testUIViewReuseIdentifier() {
        let dummyUnit = ViewUnit<UILabel>(traits: [])
        XCTAssert(dummyUnit.reuseIdentifier() == ComposingUnitCollectionViewCell<UILabel>.identifier())
    }
    
    func testUICollectionViewCellReuseIdentifier() {
        let dummyUnit = ViewUnit<DummyCollectionViewCell>(traits: [])
        XCTAssert(dummyUnit.reuseIdentifier() == DummyCollectionViewCell.identifier())
    }
    
    func testIdentifier() {
        let dummyUnit = ViewUnit<UIView>(id: "identifier", traits: [])
        XCTAssert(dummyUnit.identifier == "identifier")
    }
    
    func testUUIDIdentifier() {
        let dummyUnit = ViewUnit<UIView>(traits: [])
        XCTAssert(dummyUnit.identifier.characters.count > 0)
    }
    
    func testRegisterUIViewInCollectionView() {
        let dummyUnit = ViewUnit<UIView>(traits: [])
        dummyUnit.register(in: collectionView)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dummyUnit.reuseIdentifier(), for: sampleIndexPath)
        XCTAssert(cell is ComposingUnitCollectionViewCell<UIView>)
    }
    
    func testRegisterUICollectionViewCellInCollectionView() {
        let dummyUnit = ViewUnit<DummyCollectionViewCell>(traits: [])
        dummyUnit.register(in: collectionView)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dummyUnit.reuseIdentifier(), for: sampleIndexPath)
        XCTAssert(cell is DummyCollectionViewCell)
    }
    
}

fileprivate class DataSource: NSObject, UICollectionViewDataSource {
    
    fileprivate func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    fileprivate func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
