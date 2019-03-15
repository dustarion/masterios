//
// Created by Qin Guan on 2019-03-15.
// Copyright (c) 2019 masterapp. All rights reserved.
//

import UIKit
import Hero
import Alamofire

class LoginVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        hero.isEnabled = true
        setupViews()
        
    }
    
    fileprivate func setupViews() {
        // self.view.backgroundColor = .white
    }
    
    @IBAction func GoogleSignIn(_ sender: Any) {
        // Google Sign In
        print("Google")
        
    }
    
    @IBAction func FacebookSignIn(_ sender: Any) {
        // Facebook Sign In
        print("Facebook")
        
    }
    
    @IBAction func EmailSignIn(_ sender: Any) {
        // Email Sign In
        print("Email")
        
    }

    
}
