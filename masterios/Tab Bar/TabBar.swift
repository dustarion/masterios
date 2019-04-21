//
//  TabBar.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 19/4/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        // Setup the tab bar delegate
        self.delegate = self
    }
    
    // Show the action sheet for New Set Tab
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Test Worked!")
        if viewController.title == "NewSetTabViewController" {
            showNewSetTabOptions(sender: self)
            return false
        }
        return true
    }
}
