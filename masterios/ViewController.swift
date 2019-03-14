//
//  ViewController.swift
//  masterios
//
//  Created by Qin Guan on 2019-03-13.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(rgb: 0x212121)

        loadViews()

    }

    fileprivate func loadViews() {
        let image = UIImageView(image: UIImage(named: "MasterIconWhite"))
        self.view.addSubview(image)

        image.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: image, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([top])
    }

}
