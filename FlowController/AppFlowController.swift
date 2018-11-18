//
//  AppFlowController.swift
//  FlowController
//
//  Created by Toomas Vahter on 15/11/2018.
//  Copyright © 2018 Augmented Code. All rights reserved.
//

import UIKit

final class AppFlowController: UIResponder, AppFlowPresenting {
    private let dependencyManager: DependencyManager
    private let window: UIWindow
    
    init(window: UIWindow, dependencyManager: DependencyManager) {
        self.dependencyManager = dependencyManager
        self.window = window
    }
    
    // MARK: Presenting Flows
    
    func showInitialView() {
        let controller = LoginFlowController(window: window)
        controller.showInitialView()
        activeFlow = controller
    }
    
    func showMainView() {
        let controller = MainFlowController(window: window, dependencyManager: dependencyManager)
        controller.showInitialView()
        activeFlow = controller
    }
    
    // MARK: Managing the Responder Chain
    
    var activeFlow: FlowPresenting? = nil
    
    override var next: UIResponder? {
        return activeFlow as? UIResponder
    }
}

protocol FlowControlling {}

protocol FlowPresenting {
    func showInitialView()
}

protocol AppFlowControlling: FlowControlling {
    var appFlowController: AppFlowPresenting { get }
}

protocol AppFlowPresenting: FlowPresenting {
    func showMainView()
}

extension AppFlowControlling where Self: UIResponder {
    var appFlowController: AppFlowPresenting {
        return flowController()
    }
}

extension UIResponder {
    func flowController<T>() -> T {
        var current: UIResponder? = self
        repeat {
            if let presenter = current as? T {
                return presenter
            }
            current = current?.next
        } while current != nil
        fatalError()
    }
}
