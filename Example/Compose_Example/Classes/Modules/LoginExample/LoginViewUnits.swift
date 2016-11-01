//
//  LoginViewUnits.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

struct LoginUnits {
    
    typealias StringUpdate = (String?)-> Void
    typealias ActionCallback = ()-> Void
    
    static func HeaderUnit()-> ComposingUnit {
        let labelTraits: [ViewTraits] = [.height(80), .insets(UIEdgeInsets(horizontal: 16))]
        let loginHeader = ViewUnit<UILabel>(id: "header", traits: labelTraits) { (label) in
            let subheaderAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 14, weight: UIFontWeightLight), NSForegroundColorAttributeName: UIColor(white: 0.3, alpha: 1)]
            let headerAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 30, weight: UIFontWeightBold), NSForegroundColorAttributeName: UIColor(white: 0.1, alpha: 1)]
            let subHeaderAttributedString = NSAttributedString(string: "\nProvide your login details bellow", attributes: subheaderAttributes)
            let headerAttributedString = NSMutableAttributedString(string: "Login", attributes: headerAttributes)
            headerAttributedString.append(subHeaderAttributedString)
            label.attributedText = headerAttributedString
            label.numberOfLines = 0
        }
        return loginHeader
    }
    
    static func UsernameUnit(current username: String?, callback: @escaping StringUpdate)-> ComposingUnit {
        return TextFieldUnit(id: "username", placeholder: "Username", value: username, keyboardType: .emailAddress, updateClosure: callback)
    }
    
    static func PasswordUnit(current password: String?, callback: @escaping StringUpdate)-> ComposingUnit {
        return TextFieldUnit(id: "password", placeholder: "Password", value: password, secure: true, updateClosure: callback)
    }
    
    static func SpacerUnit(id: String, height: Int)-> ComposingUnit {
        return EmptyViewUnit(id: id, height: DimensionUnit(height))
    }
    
    static func ContinueButtonUnit(enabled: Bool, callback: @escaping ActionCallback)-> ComposingUnit {
        let viewTraits: [ViewTraits] = [.height(64), .insets(UIEdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))]
        return ViewUnit<ObservableButton>(id: "continueButton", traits: viewTraits) { button in
            button.isEnabled = enabled
            button.setTitle("Authorize", for: [])
            button.backgroundColor = enabled ? .blue : .lightGray
            button.callback = callback
        }
    }
}

