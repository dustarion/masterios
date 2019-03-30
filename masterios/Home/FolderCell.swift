//
//  FolderCell.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 17/3/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit

class FolderCellView: UIView {
    private let XIBNAME = "FolderCellView"
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(XIBNAME, owner: self, options: nil)
        contentView.fixInView(self)
    }
}







//class FolderCell: UITableViewCell {
//
//    // Outlets
//    @IBOutlet weak var ScrollView: UIScrollView!
//
//
//    // Variables
//    var folders : [MasterFolder] = [MasterFolder]()
//
////    var folderViews :
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        layoutIfNeeded()
//        removeBackground()
//        createSetsArray()
//        createFolder(x: 10.0, title: "Chemistry")
//        createFolder(x: 268.0, title: "Chemistry")
//        //createFolder(x: 466.0, title: "Chemistry")
//    }
//
//    fileprivate func removeBackground() {
//        self.backgroundColor = .clear
//    }
//
//    // Load the data into the sets.
//    fileprivate func createSetsArray() {
//
//        // Hardcoded to Test Ui
//        folders.append(MasterFolder(title: "Psychology"))
//        folders.append(MasterFolder(title: "Chemistry"))
//        folders.append(MasterFolder(title: "Psychology"))
//        folders.append(MasterFolder(title: "Biology"))
//
//        folders.append(MasterFolder(title: "Psychology"))
//        folders.append(MasterFolder(title: "Chemistry"))
//        folders.append(MasterFolder(title: "Psychology"))
//        folders.append(MasterFolder(title: "Biology"))
//
//        folders.append(MasterFolder(title: "Psychology"))
//        folders.append(MasterFolder(title: "Chemistry"))
//        folders.append(MasterFolder(title: "Psychology"))
//        folders.append(MasterFolder(title: "Biology"))
//
//        folders.append(MasterFolder(title: "Psychology"))
//        folders.append(MasterFolder(title: "Chemistry"))
//        folders.append(MasterFolder(title: "Psychology"))
//        folders.append(MasterFolder(title: "Biology"))
//    }
//
//    func createFolder(x: CGFloat, title: String) {
//        // Define
//        let height : CGFloat = 64.0
//
//        // Calculate
//        let parentHeight = ScrollView.contentSize.height
//        print(parentHeight)
//
//        let y : CGFloat = (parentHeight - height)/2
//        print(y)
//
//
//        var folderCard = UIView(frame: CGRect(x: x, y: y, width: 218, height: height))
//        folderCard.backgroundColor = .green
//
//        // Add it to the scrollview
//        ScrollView.addSubview(folderCard)
//    }
//
//
//}
