//
//  AppDelegate.swift
//  FlowController
//
//  Created by Toomas Vahter on 15/11/2018.
//  Copyright © 2018 Augmented Code. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var appFlowController: AppFlowController?
    private let dependencyManager = DependencyManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController()
        self.window = window
        appFlowController = AppFlowController(window: window, dependencyManager: dependencyManager)
        appFlowController?.showInitialView()
        window.makeKeyAndVisible()
        return true
    }
    
    override var next: UIResponder? {
        return appFlowController
    }
}

