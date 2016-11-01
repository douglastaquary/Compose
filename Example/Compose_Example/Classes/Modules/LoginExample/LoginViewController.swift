//
//  LoginViewController.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginView: LoginView! {
        didSet {
            loginView.successLoginCallback = self.showAlert
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.viewState = LoginViewState()
    }

    private func showAlert() {
        let alert = UIAlertController(title: "Authenticated", message: "You info was valid", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
