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
    
    var starships: [Starship] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starshipSearchBar.delegate = self
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return starships.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StarshipCell", for: indexPath)
        
        let starship = starships[indexPath.row]
        cell.textLabel?.text = starship.name
        
        return cell
    }
    
    
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let indexPathForCell = tableView.indexPathForSelectedRow, let destination = segue.destination as? StarshipDetailTableViewController else { return }
            
            let starship = starships[indexPathForCell.row]
            
            destination.starship = starship
        }
    }
    
}// End Of Class

extension StarshipListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        StarshipController.shared.fetchStarships(with: searchText) { (starships) in
            self.starships = starships
        }
        
    }
}
