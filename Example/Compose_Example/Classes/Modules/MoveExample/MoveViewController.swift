//
//  MoveViewController.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

class MoveViewController: UIViewController {

    @IBOutlet var moveView: MoveView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let reverseItem = UIBarButtonItem(title: "Reverse", style: .plain, target: self, action: #selector(self.reverse))
        let popItem = UIBarButtonItem(title: "Pop", style: .plain, target: self, action: #selector(self.pop))
        let peekItem = UIBarButtonItem(title: "Peek", style: .plain, target: self, action: #selector(self.peek))
        self.navigationItem.rightBarButtonItems = [reverseItem, popItem, peekItem]
        
        moveView.viewState = MoveState()
    }
    
    @IBAction func reverse() {
        moveView.viewState.colors.reverse()
    }
    
    @IBAction func peek() {
        var newColors = moveView.viewState.colors
        let color = newColors.removeLast()
        newColors.insert(color, at: 0)
        moveView.viewState.colors = newColors
    }
    
    @IBAction func pop() {
        var newColors = moveView.viewState.colors
        let color = newColors.removeFirst()
        newColors.append(color)
        moveView.viewState.colors = newColors
    }

}
