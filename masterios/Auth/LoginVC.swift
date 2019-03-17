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
    toEmailLoginVC()
    }

    @IBAction func EmailSignUp(_ sender: Any) {
        toEmailSignupVC()
    }
    
    fileprivate func toEmailLoginVC() {
        let EmailLoginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmailLoginVC") as! EmailLoginVC
        EmailLoginVC.hero.modalAnimationType = .slide(direction: .left)
        self.hero.replaceViewController(with: EmailLoginVC)
    }

    fileprivate func toEmailSignupVC() {
        let SignupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmailSignupVC") as! EmailSignupVC
        SignupVC.hero.modalAnimationType = .fade
        self.hero.replaceViewController(with: SignupVC)
    }
}