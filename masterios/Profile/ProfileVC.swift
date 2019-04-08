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
    
    override func viewDidLoad() {
    }
    
    
    // MARK: - Table view data source
    
    // Number Of Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Cell For Row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCellId, for: indexPath) //as! UITableViewCell
        return cell
    }
    
}
