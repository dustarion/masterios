//
//  FolderCellTableViewCell.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 30/3/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit

class FolderCellTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var SetCountLabel: UILabel!
    @IBOutlet weak var CardView: UIView!
    
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

    func updateData(title: String, setCount: Int) {
        print("Loading Folder Cell Data -- Title:" + title + " | " + String(setCount) + "sets" )
        TitleLabel.text = title.capitalized
        SetCountLabel.text = String(setCount) + " Sets"
    }
    
}
