//
//  LargeCollectionInsideViewController.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 26/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

class LargeCollectionInsideViewController: UIViewController {

    @IBOutlet var insideView: LargeCollectionInsideView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insideView.viewState = createNewState()
    }
    
    private func createNewState()-> LargeCollectionInsideViewState {
        let firstColors = randomColors(maxColors: 15)
        let insideColors = randomColors(maxColors: 200)
        let bottomColors = randomColors(maxColors: 15)
        
        return LargeCollectionInsideViewState(upperColors: firstColors, insideColors: insideColors, bottomColors: bottomColors)
    }

}
