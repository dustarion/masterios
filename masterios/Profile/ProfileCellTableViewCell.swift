//
//  ProfileCellTableViewCell.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 1/4/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit

class ProfileCellTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var SubtitleLabel: UILabel!
    @IBOutlet weak var CardView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        setupProfileImage()
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
    
    private func setupProfileImage() {
        ProfileImageView.clipsToBounds = true
        ProfileImageView.layer.cornerRadius = (ProfileImageView.frame.width/2)
    }
    
    func updateData(profileImage: UIImage? = nil, name: String, subtitle: String) {
        
        // Update Profile Image
        if profileImage != nil {
            ProfileImageView.image = profileImage
        }
        
        print("Loading Profile Data -- Name: " + name + " | Subtitle: " + subtitle )
        
        // Update Name and Subtitle
        NameLabel.text = name
        SubtitleLabel.text = subtitle
        
    }
}
