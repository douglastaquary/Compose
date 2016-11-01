//
//  TextFieldUnit.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

func TextFieldUnit(id: String, placeholder: String, value: String?, keyboardType: UIKeyboardType = .default, secure: Bool = false, updateClosure: @escaping LoginUnits.StringUpdate)-> ComposingUnit {
    let viewTraits: [ViewTraits] = [.height(54), .insets(UIEdgeInsets(horizontal: 16)), .backgroundColor(UIColor(white: 0.95, alpha: 1))]
    return ViewUnit<ObservableTextField>(id: id, traits: viewTraits) { textField in
        textField.placeholder = placeholder
        textField.text = value
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = secure
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.editingChangedCallback = updateClosure
    }
}
