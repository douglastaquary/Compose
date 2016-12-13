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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "scroll", style: .plain, target: self, action: #selector(scrollToRandomElement))
    }
    
    func scrollToRandomElement() {
        let unit = LargeCollectionInsideViewUnits.SpacerUnit(id: "bottom-separator")
        insideView.container.scroll(to: unit, at: .top)
    }
    
    private func createNewState()-> LargeCollectionInsideViewState {
        let firstColors = randomColors(maxColors: 15)
        let insideColors = randomColors(maxColors: 200)
        let bottomColors = randomColors(maxColors: 15)
        
        return LargeCollectionInsideViewState(upperColors: firstColors, insideColors: insideColors, bottomColors: bottomColors)
    }

}
