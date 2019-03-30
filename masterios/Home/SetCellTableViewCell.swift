//
//  SetCellTableViewCell.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 30/3/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit

class SetCellTableViewCell: UITableViewCell {
    
    // Card Background Outlet
    @IBOutlet weak var CardView: UIView!
    
    // Label Outlets
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var PercentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        setupRoundedCorners()
        setupShadow()
    }
    
    private func setupRoundedCorners() {
        CardView.clipsToBounds = true
        CardView.layer.cornerRadius = 8.0
    }
    
    private func setupShadow() {
        CardView.dropShadow(color: .black, opacity: 0.20, offSet: CGSize(width: 0, height: 7), radius: 20, scale: true)
    }
    
    func updateData(title: String, percent: String) {
        print("Loading Cell Data -- Title:" + title + " | Percentage:" + percent )
        TitleLabel.text = title.capitalized
        PercentLabel.text = percent + "% Completed"
    }
    
}
