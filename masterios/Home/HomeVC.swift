//
//  HomeVC.swift
//  masterios
//
//  Created by Dalton Prescott Ng on 30/3/19.
//  Copyright © 2019 masterapp. All rights reserved.
//


import UIKit
import Hero
import Alamofire
 
class HomeVC: UITableViewController {
    
    // Identifiers
    let SetCellId = "SetCell"
    let FolderCellId = "FolderCell"
    let HeaderCellId = "HeaderCell"
    
    // Variables Title
    var sets : [MasterSet] = [MasterSet]()
    var folders : [MasterFolder] = [MasterFolder]()
    
    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = UIColor.black
        self.hero.isEnabled = true
        createSetsArray()
        tableViewSetup()
    }
    
    // Load the data into the sets.
    fileprivate func createSetsArray() {
        dummyData() // For Testing Purposes
        
        //tableView.reloadData()
    }
    
    // For Testing Purposes
    fileprivate func dummyData() {
        
        // Dummy Data for Folders
        for _ in 0...2 {
            folders.append(MasterFolder(title: "Rocket Science", setCount: Int.random(in: 1..<50)))
        }
        
        // Dummy Data for Sets
        for _ in 0...2 {
            sets.append(MasterSet(title: "The Basic Psychology Of Human Beings", percentage: String(Int.random(in: 1..<100))))
        }
        
    }
    
    // Setting up the Table Views
    fileprivate func tableViewSetup() {
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 130
    }
    
    // MARK: - Table view data source
    
    // Height For Row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        
        if (index == 0) || (index == (sets.count+1)) {
            return (UITableView.automaticDimension >= 44) ? (UITableView.automaticDimension) : (44)
        } else {
            return UITableView.automaticDimension //>= 130//) ? (UITableView.automaticDimension) : (130)
        }
    }
    
    // Number Of Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Cell For Row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var index = indexPath.row
        
        switch index {
        // Sets Header Cell
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCellId, for: indexPath) as! HeaderCellTableViewCell
            cell.TitleLabel.text = Header.sets.rawValue
            return cell
          
        // Sets Cell
        case 1...sets.count:
            index -= 1 // Reset Index
            let cell = tableView.dequeueReusableCell(withIdentifier: SetCellId, for: indexPath) as! SetCellTableViewCell
            cell.updateData(title: sets[index].title, percent: sets[index].percentage)
            return cell
            
        // Folder Header Cell
        case (sets.count+1):
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCellId, for: indexPath) as! HeaderCellTableViewCell
            cell.TitleLabel.text = Header.folders.rawValue
            return cell
            
        // Folder Cell
        case (sets.count+1)...(sets.count+folders.count+1):
            index -= sets.count+2
            let cell = tableView.dequeueReusableCell(withIdentifier: FolderCellId, for: indexPath) as! FolderCellTableViewCell
            cell.updateData(title: folders[index].title, setCount: folders[index].setCount)
            return cell
            
        default:
            print("A Serious Error Occured When Loading the Cells")
            let cell = tableView.dequeueReusableCell(withIdentifier: SetCellId, for: indexPath) as! SetCellTableViewCell
            cell.updateData(title: sets[index].title, percent: sets[index].percentage)
            return cell
        }
    }
    
    // Handling Sections
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sets.count + folders.count + 2)
    }
    
    // Handling Clicking On Cells
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row: " + String(indexPath.row))
    }
    
}
