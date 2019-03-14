//
// Created by Qin Guan on 2019-03-15.
// Copyright (c) 2019 masterapp. All rights reserved.
//

import Foundation
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
    self.view.backgroundColor = .white
  }

}
