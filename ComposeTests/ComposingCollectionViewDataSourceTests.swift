//
//  BlockCollectionDataSourceTests.swift
//  ComposingBlocks
//
//  Created by Bruno Bilescky on 04/10/16.
//  Copyright © 2016 bgondim. All rights reserved.
//

import XCTest
@testable import Compose

class ComposingCollectionViewDataSourceTests: XCTestCase {
    
    let dataSource = ComposingCollectionViewDataSource(with: ComposingDataSource(initialState: []))
    let dummyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let dummyIndexPath = IndexPath(item: 0, section: 0)
    
    override func setUp() {
        super.setUp()
        dummyCollectionView.dataSource = nil
        dataSource.source.state = []
    }
    
    func testInitialState() {
        let dummyOne = ViewUnit<UILabel>(traits:[])
        let source = ComposingDataSource(initialState: [dummyOne])
        let dataSource = ComposingCollectionViewDataSource(with: source)
        XCTAssert(dataSource.source.state.count == 1)
    }
    
    func testNumberOfItems() {
        let dummyOne = ViewUnit<UILabel>(traits:[])
        dataSource.source.state = [dummyOne]
        XCTAssert(dataSource.collectionView(dummyCollectionView, numberOfItemsInSection: 0) == 1)
    }
    
    func testCollectionDequeue() {
        let dummy = ViewUnit<UILabel>(traits:[])
        dataSource.source.state = [dummy]
        dummyCollectionView.dataSource = dataSource
        let cell = dataSource.collectionView(dummyCollectionView, cellForItemAt: dummyIndexPath)
        XCTAssert(cell is ComposingUnitCollectionViewCell<UILabel>)
    }
    
}
