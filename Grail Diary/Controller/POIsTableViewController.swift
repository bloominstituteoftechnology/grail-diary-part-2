//
//  ViewController.swift
//  Grail Diary
//
//  Created by Jason Hoover on 5/12/20.
//  Copyright © 2020 Jason Hoover. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var pointOfInterests: [POI] = [POI(location: "France", POI: "Paris", clues: ["The Eiffel Tower was a temporary construction", "There’s only one STOP sign in the entire city of Paris", "The oldest bridge in Paris is the Pont Neuf (New Bridge)"])]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pointOfInterests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            fatalError("Cell identifier is incorrect or the cell is not of the expected type POITableViewCell")
        }
        
        let point = pointOfInterests[indexPath.row]
        
        cell.locationNameLabel.text = point.locationName
        cell.countryLabel.text = point.country
        cell.cluesLabel.text = "\(point.clues.count) of clues"
        
        return cell
    }
