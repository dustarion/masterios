//
//  HeaderCellTableViewCell.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 30/3/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit

class HeaderCellTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var SeeAllButton: UIButton!
    
    
    @IBAction func SeeAllButtonClicked(_ sender: Any) {
        print("See All")
    }
    
}

enum Header : String {
    case folders = "Folders"
    case sets = "Sets"
}
