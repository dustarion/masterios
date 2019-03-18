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
        setup()
    }
    
    fileprivate func setup() {
        // Check for previous Login Here
        // Redirect to Login Screen or into the app approriately.
        // Later on we can add better onboarding experience but not a priority for now.
        
        
        
        // Go to Login
        //toLoginVC()
        
        // Go to Main
        toMainVC()
    }
    
    fileprivate func toLoginVC() {
        let NextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FullLogoVC") as! RootVC
        NextVC.hero.modalAnimationType = .fade
        self.hero.replaceViewController(with: NextVC)
    }
    
    fileprivate func toMainVC() {
        let NextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabController") as! UITabBarController
        NextVC.hero.modalAnimationType = .fade
        self.hero.replaceViewController(with: NextVC)
    }

}
//MainTabController
