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
    
    // Variablestitle
    var sets : [MasterSet] = [MasterSet]()
    var folders : [MasterFolder] = [MasterFolder]()
    
    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = UIColor.black
        self.hero.isEnabled = true
        createSetsArray() // For Testing Purposes
        tableViewSetup()
    }
    
    // Load the data into the sets.
    fileprivate func createSetsArray() {
        dummyData()
    }
    
    fileprivate func dummyData() {
        
        // Dummy Data for Folders
        for _ in 0...20 {
            folders.append(MasterFolder(title: "Rocket Science", setCount: 23))
        }
        
        // Dummy Data for Sets
        for _ in 0...20 {
            sets.append(MasterSet(title: "THE BASIC PSYCHOLOGY of HUMAN BEINGS", percentage: "40"))
        }
        
    }
    
    // Setting up the Table Views
    fileprivate func tableViewSetup() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 130
    }
    
    // MARK: - Table view data source
    
    // Height For Row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (UITableView.automaticDimension >= 130) ? (UITableView.automaticDimension) : (130)
    }
    
    // Number Of Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Cell For Row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        // Folder
        if (index%2 == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: FolderCellId, for: indexPath) as! FolderCellTableViewCell
            cell.updateData(title: folders[index].title, setCount: folders[index].setCount)
            return cell
        }
        
        // Normal Set
        let cell = tableView.dequeueReusableCell(withIdentifier: SetCellId, for: indexPath) as! SetCellTableViewCell
        cell.updateData(title: sets[index].title, percent: sets[index].percentage)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sets.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row: " + String(indexPath.row))
    }
    
    
}
