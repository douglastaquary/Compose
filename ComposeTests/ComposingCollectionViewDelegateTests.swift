//
//  BlockCollectionDelegateTests.swift
//  ComposingBlocks
//
//  Created by Bruno Bilescky on 05/10/16.
//  Copyright © 2016 bgondim. All rights reserved.
//

import XCTest
@testable import Compose

class ComposingCollectionViewDelegateTests: XCTestCase {
    
    let dataSource = ComposingDataSource(initialState: [])
    lazy var delegate: ComposingCollectionViewDelegate = {
        let delegate = ComposingCollectionViewDelegate(with: self.dataSource)
        return delegate
    }()
    
    let collectionViewLayout = UICollectionViewFlowLayout()
    let dummyIndexPath = IndexPath(item: 0, section: 0)
    
    lazy var collectionView: UICollectionView = {
        let c = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewLayout)
        c.dataSource = ComposingCollectionViewDataSource(with: self.dataSource)
        c.delegate = self.delegate
        return c
    }()
    
    override func setUp() {
        super.setUp()
        collectionViewLayout.sectionInset = .zero
    }
    
    func testVerticalNoInsetsItem() {
        let dummyOne = ViewUnit<UILabel>(traits:[.height(100)])
        dataSource.state = [dummyOne]
        delegate.direction = .vertical
        let size = delegate.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAt: dummyIndexPath)
        XCTAssert(size.height == 100)
    }
    
    func testVerticalInsetedItem() {
        let dummyOne = ViewUnit<UILabel>(traits:[.height(DimensionUnit(heightPercent: 1.0))])
        dataSource.state = [dummyOne]
        collectionViewLayout.sectionInset = UIEdgeInsets(vertical: 10)
        collectionView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        delegate.direction = .vertical
        let size = delegate.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAt: dummyIndexPath)
        XCTAssert(size.height == 80)
    }
    
    func testHorizontalNoInsetsItem() {
        let dummyOne = ViewUnit<UILabel>(traits:[.width(100)])
        dataSource.state = [dummyOne]
        delegate.direction = .horizontal
        let size = delegate.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAt: dummyIndexPath)
        XCTAssert(size.width == 100)
    }
    
    func testHorizontalInsetedItem() {
        let dummyOne = ViewUnit<UILabel>(traits:[.width(DimensionUnit(widthPercent: 1.0))])
        dataSource.state = [dummyOne]
        collectionViewLayout.sectionInset = UIEdgeInsets(horizontal: 10)
        collectionView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        delegate.direction = .horizontal
        let size = delegate.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAt: dummyIndexPath)
        XCTAssert(size.width == 80)
    }
    
    func testCustomCollectionLayout() {
        let dummyOne = ViewUnit<UILabel>(traits:[.width(DimensionUnit(widthPercent: 1.0))])
        dataSource.state = [dummyOne]
        collectionView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        delegate.direction = .horizontal
        let customLayout = CustomCollectionLayout()
        let size = delegate.collectionView(collectionView, layout: customLayout, sizeForItemAt: dummyIndexPath)
        XCTAssert(size.width == 100)
    }
    
    func testShouldSelectDelegateCallbacks() {
        var dummy = CollectionUnit()
        dummy.shouldSelectCallback = { false }
        dataSource.state = [dummy]
        let shouldNotSelect = delegate.collectionView(collectionView, shouldSelectItemAt: dummyIndexPath)
        XCTAssert(shouldNotSelect == false)
        
        dummy.shouldSelectCallback = { true }
        dataSource.state = [dummy]
        let shouldSelect = delegate.collectionView(collectionView, shouldSelectItemAt: dummyIndexPath)
        XCTAssert(shouldSelect == true)
    }
    
    func testDidSelectCallback() {
        var dummy = CollectionUnit()
        let selectExpectation = expectation(description: "should call didSelect callback")
        dummy.didSelectCallback = { selectExpectation.fulfill() }
        dataSource.state = [dummy]
        delegate.collectionView(collectionView, didSelectItemAt: dummyIndexPath)
        waitForExpectations(timeout: 1.0) { (error) in
            XCTAssert(error == nil)
        }
    }
    
}

fileprivate struct CollectionUnit: SelectableUnit, TwoStepDisplayUnit {
    fileprivate let identifier = "dummy"

    var configureCallback: ((UIView)-> Void) = { _ in }
    var beforeDisplayCallback: ((UIView)-> Void) = { _ in }
    var afterDisplayCallback: ((UIView)-> Void) = { _ in }
    var didSelectCallback: (()-> Void) = { }
    var shouldSelectCallback: (()-> Bool) = { return true }
    var didHightlightCallback: (()-> Void) = { }
    var didUnhightlightCallback: (()-> Void) = { }
    
    fileprivate func reuseIdentifier() -> String {
        return UICollectionViewCell.identifier()
    }
    
    fileprivate func register(in collectionView: UICollectionView) {
        UICollectionViewCell.register(in: collectionView)
    }
    
    fileprivate func configure(view: UIView) {
        configureCallback(view)
    }
    
    fileprivate func beforeDisplay(view: UIView) {
        beforeDisplayCallback(view)
    }
    
    fileprivate func afterDisplay(view: UIView) {
        afterDisplayCallback(view)
    }
    
    fileprivate func didSelect() {
        didSelectCallback()
    }
    
    fileprivate func shouldSelect() -> Bool {
        return shouldSelectCallback()
    }
    
    fileprivate func didHightlight() {
        didHightlightCallback()
    }
    
    fileprivate func didUnhightlight() {
        didHightlightCallback()
    }
    
    
}

fileprivate class CustomCollectionLayout: UICollectionViewLayout {
    
}
