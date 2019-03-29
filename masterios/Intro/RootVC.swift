//
//  RootVC.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 16/3/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit
class RootVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        hero.isEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        toLoginVC()
    }
    
    fileprivate func toLoginVC() {
        let NextVC = AppStoryboard.Login.instance.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        NextVC.hero.modalAnimationType = .fade
        self.hero.replaceViewController(with: NextVC)
    }
}
