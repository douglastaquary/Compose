//
//  ObservableTextField.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

class ObservableTextField: UITextField {
    
    var editingChangedCallback: ((String?)-> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.addTarget(self, action: #selector(didEditingChangedText(textField:)), for: [.editingChanged])
    }
    
    @objc private func didEditingChangedText(textField: UITextField) {
        editingChangedCallback?(textField.text)
    }
    
}
