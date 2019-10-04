//
//  StarshipListTableViewController.swift
//  StarWarsAPI
//
//  Created by Zebadiah Watson on 10/3/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class StarshipListTableViewController: UITableViewController {

    // outlet
    @IBOutlet var starshipSearchBar: UITableView!
    @IBOutlet weak var starshipCell: UITableViewCell!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    

 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
