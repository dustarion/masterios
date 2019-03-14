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
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(rgb: 0x212121)

        loadViews()

    }

    fileprivate func loadViews() {
        let image = UIImageView(image: UIImage(named: "MasterIconWhite"))
        image.contentMode = .scaleAspectFit
        self.view.addSubview(image)

        image.translatesAutoresizingMaskIntoConstraints = false

        let height = NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150)
        let width = NSLayoutConstraint(item: image, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150)
        let centerX = NSLayoutConstraint(item: image, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        let centerY = NSLayoutConstraint(item: image, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)

        NSLayoutConstraint.activate([height, width, centerX, centerY])
    }

}
