//
//  LoginFlowController.swift
//  FlowController
//
//  Created by Toomas Vahter on 15/11/2018.
//  Copyright © 2018 Augmented Code. All rights reserved.
//

import UIKit

final class LoginFlowController: UIResponder, LoginFlowPresenting {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showInitialView() {
        let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: "login")
        (window.rootViewController as? UINavigationController)?.setViewControllers([viewController], animated: false)
    }
    
    func showSignUp() {
        let viewController = SignUpViewController()
        (window.rootViewController as? UINavigationController)?.pushViewController(viewController, animated: true)
    }
    
    func showAccountDetails() {
        let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: "accountdetails")
        (window.rootViewController as? UINavigationController)?.pushViewController(viewController, animated: true)
    }
}

protocol LoginFlowPresenting: FlowPresenting {
    func showAccountDetails()
    func showSignUp()
}

protocol LoginFlowControlling: FlowControlling {
    var loginFlowController: LoginFlowPresenting { get }
}

extension LoginFlowControlling where Self: UIResponder {
    var loginFlowController: LoginFlowPresenting {
        return flowController()
    }
}

extension UIStoryboard {
    class var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
