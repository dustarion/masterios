//
//  ViewController.swift
//  masterios
//
//  Created by Qin Guan on 2019-03-13.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit

// This view is the first view seen by the user. Shows the master logo in the same position as the Launchscreen.
// Check for Login, and login as needed, or redirect to the signup screen.

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = UIScreen.main.bounds
        self.view.backgroundColor = UIColor(rgb: 0x212121)
        
        loadViews()

    }

    fileprivate func loadViews() {
        let image = UIImageView(image: UIImage(named: "MasterIconWhite"))
        image.frame = CGRect(x: 151.0, y: 304.0, width: 72.0, height: 59.0)
        self.view.addSubview(image)

        image.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: image, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([top])
    }

}
