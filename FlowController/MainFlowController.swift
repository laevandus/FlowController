//
//  MainFlowController.swift
//  FlowController
//
//  Created by Toomas Vahter on 18/11/2018.
//  Copyright © 2018 Augmented Code. All rights reserved.
//

import UIKit

final class MainFlowController: UIResponder, MainFlowPresenting {
    private let dependencyManager: DependencyManager
    private let window: UIWindow
    
    init(window: UIWindow, dependencyManager: DependencyManager) {
        self.dependencyManager = dependencyManager
        self.window = window
    }
    
    func showInitialView() {
        let viewController = MainViewController(contactManager: dependencyManager.contactManager)
        (window.rootViewController as? UINavigationController)?.setViewControllers([viewController], animated: false)
    }
}

protocol MainFlowPresenting: FlowPresenting {}

protocol MainFlowControlling: FlowControlling {
    var mainFlowController: MainFlowPresenting { get }
}

extension MainFlowControlling where Self: UIResponder {
    var mainFlowController: MainFlowPresenting {
        return flowController()
    }
}
