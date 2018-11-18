//
//  MainViewController.swift
//  FlowController
//
//  Created by Toomas Vahter on 18/11/2018.
//  Copyright © 2018 Augmented Code. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, AppFlowControlling {
    let contactManager: ContactManager
    
    init(contactManager: ContactManager) {
        self.contactManager = contactManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func logout(_ sender: Any) {
        appFlowController.showInitialView()
    }
}
