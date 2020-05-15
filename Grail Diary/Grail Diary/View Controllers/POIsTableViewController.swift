//
//  POIsViewController.swift
//  Grail Diary
//
//  Created by Rebecca Overare on 5/14/20.
//  Copyright © 2020 Rebecca Overare. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var POIs: [POI] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            let newPOIVC = segue.destination as? AddPOIViewController
            newPOIVC?.delegate = self
            dismiss(animated: true, completion: nil)
            
        } else if segue.identifier == "ShowPOIDetailSegue" {
            let detailVC = segue.destination as? POIDetailViewController
           if let indexPath = tableView.indexPathForSelectedRow {
            let poi = POIs[indexPath.row]
            detailVC?.poi = poi

            }
        }
    }
    
}


extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            fatalError("Cell identifier is wrong or the cell is not of expected type FriendTableViewCell")
        }
        let poi = POIs[indexPath.row]
        cell.locationLabel.text = poi.location
        cell.countryLabel.text = poi.country
        cell.cluesLabel.text = "\(poi.clues.count) clues"
        
        return cell
    }
    
}


extension POIsTableViewController: AddPOIDelegate {
    func addPOI(POI: POI) {
        POIs.append(POI)
        tableView.reloadData()
    }
    
    
}
