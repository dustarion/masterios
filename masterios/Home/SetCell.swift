//
//  SetCell.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 17/3/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit

class SetCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var PercentageLabel: UILabel!
    
    @IBOutlet weak var cardBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutIfNeeded()
        removeBackground()
        setupRoundedCorners()
        setupShadow()
    }
    
    func removeBackground() {
        self.backgroundColor = .clear
    }
    
    func setupRoundedCorners() {
        cardBackground.clipsToBounds = true
        cardBackground.layer.cornerRadius = 8.0
    }
    
    func setupShadow() {
        cardBackground.dropShadow(color: .black, opacity: 0.20, offSet: CGSize(width: 0, height: 7), radius: 20, scale: true)
    }
}






