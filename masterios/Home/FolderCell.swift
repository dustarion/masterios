//
//  FolderCell.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 17/3/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit

class FolderCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var ScrollView: UIScrollView!
    
    
    // Variables
    var folders : [MasterFolder] = [MasterFolder]()
    
    var folderViews :
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutIfNeeded()
        removeBackground()
        createSetsArray()
        createFolder(x: 10.0, title: "Chemistry")
    }
    
    fileprivate func removeBackground() {
        self.backgroundColor = .clear
    }
    
    // Load the data into the sets.
    fileprivate func createSetsArray() {
        
        // Hardcoded to Test Ui
        folders.append(MasterFolder(title: "Psychology"))
        folders.append(MasterFolder(title: "Chemistry"))
        folders.append(MasterFolder(title: "Psychology"))
        folders.append(MasterFolder(title: "Biology"))
        
        folders.append(MasterFolder(title: "Psychology"))
        folders.append(MasterFolder(title: "Chemistry"))
        folders.append(MasterFolder(title: "Psychology"))
        folders.append(MasterFolder(title: "Biology"))
        
        folders.append(MasterFolder(title: "Psychology"))
        folders.append(MasterFolder(title: "Chemistry"))
        folders.append(MasterFolder(title: "Psychology"))
        folders.append(MasterFolder(title: "Biology"))
        
        folders.append(MasterFolder(title: "Psychology"))
        folders.append(MasterFolder(title: "Chemistry"))
        folders.append(MasterFolder(title: "Psychology"))
        folders.append(MasterFolder(title: "Biology"))
    }
    
    func createFolder(x: CGFloat, title: String) {
        // Define
        let height : CGFloat = 64.0
        
        // Calculate
        let parentHeight = ScrollView.contentSize.height
        print(parentHeight)
        
        let y : CGFloat = (parentHeight - height)/2
        print(y)
        
        
        var folderCard = UIView(frame: CGRect(x: x, y: y, width: 218, height: height))
        folderCard.backgroundColor = .green
        
        // Add it to the scrollview
        ScrollView.addSubview(folderCard)
    }
    
    
}


// Set Struct
struct MasterFolder {
    var title : String
    // @Qinguan -- Code/Whatver you need here
}


//    func setupRoundedCorners() {
//        cardBackground.clipsToBounds = true
//        cardBackground.layer.cornerRadius = 8.0
//    }
//
//    func setupShadow() {
//        cardBackground.dropShadow(color: .black, opacity: 0.20, offSet: CGSize(width: 0, height: 7), radius: 20, scale: true)
//    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        layoutIfNeeded()
//        removeBackground()
//    }
//
//    fileprivate func removeBackground() {
//        self.backgroundColor = .clear
//}
//
