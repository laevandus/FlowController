//
//  SignUpViewController.swift
//  FlowController
//
//  Created by Toomas Vahter on 18/11/2018.
//  Copyright © 2018 Augmented Code. All rights reserved.
//

import UIKit

final class SignUpViewController: UIViewController, LoginFlowControlling {
    @IBAction func goToAccountDetails(_ sender: Any) {
        loginFlowController.showAccountDetails()
    }
}
