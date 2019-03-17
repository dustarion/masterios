//
//  Home.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 17/3/19.
//  Copyright © 2019 masterapp. All rights reserved.
//

import UIKit
import Hero
import Alamofire

class HomeVC: UITableViewController {

    // Identifiers
    let SetCellId = "SetCell"
    let FolderCellId = "FolderCell"
    
    // Variables
    var sets : [MasterSet] = [MasterSet]()
    
    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = UIColor.black
        self.hero.isEnabled = true
        createSetsArray()
        tableViewSetup()
    }
    
    // Load the data into the sets.
    fileprivate func createSetsArray() {
        
        // Hardcoded to Test Ui
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY OF HUMAN BEINGS", percentage: "40% Completed"))
        
    }
    
    // Setting up the Table Views
    fileprivate func tableViewSetup() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 130
    }
    
    // MARK: - Table view data source
    
    // Height For Row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return 130
    }
    
    // Number Of Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Cell For Row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        // Folder
        if index == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FolderCellId, for: indexPath) as! FolderCell
            return cell
        }
        
        // Normal Set
        let cell = tableView.dequeueReusableCell(withIdentifier: SetCellId, for: indexPath) as! SetCell
        cell.TitleLabel.text = sets[index].title
        cell.PercentageLabel.text = sets[index].percentage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sets.count
    }
  
    
}

// Set Struct
struct MasterSet {
    var title : String
    var percentage : String
}
