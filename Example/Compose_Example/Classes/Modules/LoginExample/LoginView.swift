//
//  LoginView.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

class LoginView: CollectionStackView {
    
    var viewState: LoginViewState! {
        didSet {
            self.updateWith(state: self.stateUnits)
        }
    }
    
    var successLoginCallback: (()-> Void)?
    
    func stateUnits()-> [ComposingUnit] {
        var units: [ComposingUnit] = []
        units.add {
            let topSeparator = LoginUnits.SpacerUnit(id: "top", height: 14)
            let header = LoginUnits.HeaderUnit()
            return [topSeparator, header]
        }
        units.add {
            let username = LoginUnits.UsernameUnit(current: viewState.username, callback: updateUsername(newUsername:))
            let password = LoginUnits.PasswordUnit(current: viewState.password, callback: updatePassword(newPassword:))
            return [username, password]
        }
        let continueButton = LoginUnits.ContinueButtonUnit(enabled: viewState.validData, callback: doTryLogin)
        units.append(continueButton)
        
        return units
    }
    
    private func updateUsername(newUsername: String?) {
        viewState.username = newUsername
    }
    
    private func updatePassword(newPassword: String?) {
        viewState.password = newPassword
    }
    
    private func doTryLogin() {
        successLoginCallback?()
    }
    
}
