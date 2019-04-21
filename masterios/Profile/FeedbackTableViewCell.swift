//
//  FeedbackTableViewCell.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 17/4/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit

class FeedbackTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var CardView: UIView!
    
    @IBOutlet weak var MessageLabel: UITextView!
    
    override func awakeFromNib() {
        MessageLabel.text = "Spicy jalapeno bacon ipsum dolor amet short loin cupidatat est, pork pancetta velit kevin occaecat ipsum aliqua ham pritip incididunt."
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
    
}
