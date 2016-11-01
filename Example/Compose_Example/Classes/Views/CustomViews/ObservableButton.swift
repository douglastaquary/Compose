//
//  ObservableButton.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

class ObservableButton: UIButton {
    
    var callback: (()-> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit() {
        self.addTarget(self, action: #selector(doAction), for: .touchUpInside)
    }
    
    @objc private func doAction() {
        callback?()
    }
    
}
