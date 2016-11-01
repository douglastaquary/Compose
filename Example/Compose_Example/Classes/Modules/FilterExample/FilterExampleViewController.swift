//
//  FilterExampleViewController.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

class FilterExampleViewController: UIViewController {

    @IBOutlet var stackView: TableStackView! {
        didSet {
            stackView.container.tableFooterView = UIView()
            stackView.container.deletionAnimation = .fade
            stackView.container.insertionAnimation = .fade
            stackView.updateWith(state: self.viewUnits)
        }
    }
    
    @IBOutlet var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = searchBarDelegate
        }
    }
    
    let searchBarDelegate = SearchBarDelegate()
    
    var viewState: FilterState = FilterState() {
        didSet {
            stackView.updateWith(state: self.viewUnits)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarDelegate.onChangeCallback = { input in
            self.viewState.filterText = input
        }
        searchBarDelegate.onScopeSelected = { index in
            self.searchBar.resignFirstResponder()
            self.viewState.filterGoing = FilterState.Status(rawValue: index - 1)
        }
    }
    
    private func viewUnits()-> [ComposingUnit] {
        var units: [ComposingUnit] = []
        units.add {
            return self.viewState.filteredData.map { FilterUnits.TextEntryUnit(entry: $0) }
        }
        units.add(if: units.count == 0) {
            return FilterUnits.EmptyUnit()
        }
        return units
    }

}
