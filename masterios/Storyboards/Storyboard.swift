//
//  Storyboard.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 29/3/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryboard : String {
    case Main = "Main"
    case Login = "Login"
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
        //return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}

/* Usage */
// let storyboard = AppStoryboard.Main.instance

/* Old Way */
// let storyboard = UIStoryboard(name: “Main”, bundle: Bundle.main)

/* Reference Material */
// https://gist.github.com/Gurdeep0602/4fc3892c1b2861d4cd2062ddfddf3262
// https://medium.com/@gurdeep060289/clean-code-for-multiple-storyboards-c64eb679dbf6
