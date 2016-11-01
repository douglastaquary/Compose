//
//  SelectExampleViewController.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

class SelectExampleViewController: UIViewController {

    @IBOutlet var stackView: TableStackView! {
        didSet {
            stackView.container.tableFooterView = UIView()
            stackView.updateWith(state: self.exampleUnits)
        }
    }
    
    private func didSelectExample(unit: ComposingUnit) {
        let identifier = unit.identifier
        self.performSegue(withIdentifier: identifier, sender: nil)
    }
    
    private func exampleUnits()-> [ComposingUnit] {
        return SelectExamplesUnits.allUnits(callback: self.didSelectExample(unit:))
    }

}
