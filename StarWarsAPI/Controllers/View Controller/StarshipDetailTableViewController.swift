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
    
    var starship: Starship? {
        didSet {
            self.loadViewIfNeeded()
            guard let starship = starship else { return }
            for film in starship.films {
                StarshipController.shared.getFilm(filmURL: film) { (film) in
                    guard let film = film else { return }
                    let title = film.title
                    self.films.append(title)
                }
            }
        }
    }
    
    var films: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    
    func updateViews() {
        guard let starship = starship else { return }
        nameLabel.text = starship.name
        costCell.text = starship.cost
        modelLabel.text = starship.model
        speedLabel.text = starship.speed
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return films.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)
        
        let film = films[indexPath.row]
        cell.textLabel?.text = film
        
        return cell
    }
    


}
