//
//  LoginViewState.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

struct LoginViewState {
    
    var username: String?
    var password: String?
    
    var validUsername: Bool {
        guard let username = username else { return false }
        return username.characters.count > 4 && username.range(of: "@") != nil
    }
    
    var validPassword: Bool {
        guard let password = password else { return false }
        return password.characters.count > 2
    }
    
    var validData: Bool {
        return validUsername && validPassword
    }
    
    init(username: String? = nil, password: String? = nil) {
        self.username = username
        self.password = password
    }
    
}

