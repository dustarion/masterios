//
//  ProfileVC.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 1/4/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit

class ProfileVC: UITableViewController {
    
    // Identifiers
    let ProfileCellId = "ProfileCell"
    let HeaderCellID = "ProfileHeaderCell"
    let FeedbackCellID = "FeedbackCell"
    
    override func viewDidLoad() {
    }
    
    // Setting up the Table Views
    fileprivate func tableViewSetup() {
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 130
    }
    
    // MARK: - Table view data source
    
    // Number Of Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // Height For Row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        
        switch index {
        case 0:
            return (UITableView.automaticDimension >= 300) ? (UITableView.automaticDimension) : (300)
        case 1:
            return (UITableView.automaticDimension >= 44) ? (UITableView.automaticDimension) : (44)
        case _ where index >= 2:
            return (UITableView.automaticDimension >= 100) ? (UITableView.automaticDimension) : (100)
        default:
            return (UITableView.automaticDimension >= 100) ? (UITableView.automaticDimension) : (100)
        }
    }
    
    // Feedback Dummy Data
    //    let dummyFeedback =
    
    // Cell For Row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        var cell = UITableViewCell()
        
        switch index {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: ProfileCellId, for: indexPath) as! ProfileCellTableViewCell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: HeaderCellID, for: indexPath) as! ProfileHeaderTableViewCell
        case _ where index >= 2:
            cell = tableView.dequeueReusableCell(withIdentifier: FeedbackCellID, for: indexPath) as! FeedbackTableViewCell
            
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: FeedbackCellID, for: indexPath) as! FeedbackTableViewCell
        }
        
        return cell
    }
    
}
