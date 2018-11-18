//
//  LoginViewController.swift
//  FlowController
//
//  Created by Toomas Vahter on 15/11/2018.
//  Copyright © 2018 Augmented Code. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController, LoginFlowControlling {
    @IBAction func createAccount(_ sender: Any) {
        loginFlowController.showSignUp()
    }
}
