//
//  EmailLoginVC.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 16/3/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit
import Hero
import Alamofire

class EmailLoginVC: UIViewController {
  override func viewDidAppear(_ animated: Bool) {
    //
  }


  @IBAction func BackButton(_ sender: Any) {
    toLoginVC() // Transition Back
  }


  fileprivate func toLoginVC() {
    let LoginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
    LoginVC.hero.modalAnimationType = .slide(direction: .right)
    self.hero.replaceViewController(with: LoginVC)
  }
}
