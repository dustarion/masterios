//
//  InitVC.swift
//  masterios
//
//  Created by Qin Guan on 2019-03-13.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit
import Hero

class InitVC: UIViewController {

    override func viewDidLoad() {
        print("ViewLoaded")
        super.viewDidLoad()
        hero.isEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        toLoginVC()
    }
    
    fileprivate func setup() {
        // Check for previous Login Here
        // Redirect to Login Screen or into the app approriately.
        // Later on we can add better onboarding experience but not a priority for now.
        
        // Go to Login, Temporary Test Code
        toLoginVC()
    }
    
    fileprivate func toLoginVC() {
        self.performSegue(withIdentifier: "toLogin", sender: self)
        
        
    }

}
