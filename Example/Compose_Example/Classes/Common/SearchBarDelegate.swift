//
//  SearchBarDelegate.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

class SearchBarDelegate: NSObject, UISearchBarDelegate {

    var onChangeCallback: ((String)-> Void) = { _ in }
    var onScopeSelected: ((Int)-> Void) = { _ in }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        onChangeCallback(searchText)
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        onScopeSelected(selectedScope)
    }
    
}
