//
//  MultipleColumnViewController.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

class MultipleColumnViewController: UIViewController {

    @IBOutlet var orientationSegmentedControl: UISegmentedControl!
    
    @IBOutlet var multipleView: MultipleColumnView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let addItem = UIBarButtonItem(title: " + ", style: .plain, target: self, action: #selector(self.addColumn))
        let deleteItem = UIBarButtonItem(title: " - ", style: .plain, target: self, action: #selector(self.removeColumn))
        self.navigationItem.rightBarButtonItems = [addItem, deleteItem]
        
        multipleView.viewState = MultipleColumnViewState(numberOfItems: 1, vertical: true)
        multipleView.updateWith {
            return randomColors(maxColors: 35).map { MultipleColumnViewUnits.SingleUnit(color: $0) }
        }
    }
    
    @IBAction func addColumn() {
        multipleView.viewState.numberOfItems = min(multipleView.viewState.numberOfItems + 1, 5)
    }
    
    @IBAction func removeColumn() {
        multipleView.viewState.numberOfItems = max(multipleView.viewState.numberOfItems - 1, 1)
    }
    
    @IBAction func changeOrientation(segmentControl: UISegmentedControl) {
        multipleView.viewState.isVertical = segmentControl.selectedSegmentIndex == 0
    }

}
