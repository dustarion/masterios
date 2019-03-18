//
// Created by Qin Guan on 2019-03-15.
// Copyright (c) 2019 masterapp. All rights reserved.
//

import UIKit
import Hero
import Alamofire
import GoogleSignIn

class LoginVC: UIViewController, GIDSignInUIDelegate {
  override func viewDidLoad() {
    super.viewDidLoad()
    setListeners()
    GIDSignIn.sharedInstance().uiDelegate = self
    hero.isEnabled = true
    setupViews()
  }

  @objc fileprivate func handleLoginError(_ notification: NSNotification) {
    if let error = notification.userInfo?["error"] as? Error {
      print(error.localizedDescription)
    }
  }

  fileprivate func setListeners() {
    NotificationCenter.default.addObserver(self, selector: #selector(handleLoginError(_:)), name: NSNotification.Name(rawValue: Login.GIDLOGINERROR.rawValue), object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(toHomeVC), name: NSNotification.Name(rawValue: Login.GIDSUCCESS.rawValue), object: nil)
  }

  fileprivate func setupViews() {
    // self.view.backgroundColor = .white
  }


  @IBAction func GoogleSignIn(_ sender: Any) {
    // Google Sign In
    print("Google")
    if GIDSignIn.sharedInstance().currentUser != nil {
      GIDSignIn.sharedInstance().signOut()
    }
    GIDSignIn.sharedInstance().signIn()
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

  @objc fileprivate func toHomeVC() {
    print("tohome")
  }
}
