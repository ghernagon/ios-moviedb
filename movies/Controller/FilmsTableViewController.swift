//
//  FilmsTableViewController.swift
//  movies
//
//  Created by Gerardo Hernández González on 29-04-20.
//  Copyright © 2020 Gerardo Hernández González. All rights reserved.
//

import UIKit

class FilmsTableViewController: UITableViewController {
    
    var filmsManager = FilmsManager()
    var films: Films?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Popular Movies"

        self.fetchPopular { (_) in }
        
        tableView.rowHeight = 50.0
    }
    
    func fetchPopular(completionHandler: @escaping(_ status: Bool) -> Void) {
        filmsManager.fetchPopular { (films, error) in
            if error != nil {
                print(error)
                completionHandler(false)
            } else {
                self.films = films
                self.tableView.reloadData()
                completionHandler(true)
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films?.all.count ?? 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedFilm = films?.all[tableView.indexPathForSelectedRow!.row]
        }
    }
}

// MARK: - Table view delegate methods

extension FilmsTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)
        
        if films != nil {
            let item = films!.all[indexPath.row]
            
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = "Release date: \(String(describing: item.releaseDate))"
        } else {
            cell.textLabel?.text = "There is no data to display"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: self)
    }
}

//extension FilmsTableViewController: FilmsManagerDelegate {
//    func didFetchResults(films: Films) {
//        self.films = films
//        tableView.reloadData()
//    }
//
//    func didFailWithError(error: String?) {
//        debugPrint(error)
//    }
//}
