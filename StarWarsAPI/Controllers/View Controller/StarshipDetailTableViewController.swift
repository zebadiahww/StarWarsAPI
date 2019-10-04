//
//  StarshipDetailTableViewController.swift
//  StarWarsAPI
//
//  Created by Zebadiah Watson on 10/3/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class StarshipDetailTableViewController: UITableViewController {
    
    //Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var costCell: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var filmCell: UITableViewCell!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    


}
