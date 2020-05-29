//
//  ViewController.swift
//  GrailDiary
//
//  Created by Gladymir Philippe on 5/22/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit

class P0IsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var placeOfInterest: [POI] = [POI(location: "New York", country: "USA", clues: ["Mets", "Yankees", "Jets"])]
    
    override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
   // placeOfInterest.append(POI(location: "New York", country: "USA", clues: ["Mets", "Yankees", "Jets"]))
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOlModalSeque" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
                
            } else if segue.identifier == "ShowPOlDetailSegue" {
                if let indexPath = tableView.indexPathForSelectedRow,
                    let POIDetailViewController = segue.destination as? POIDetailViewController {
                    POIDetailViewController.poi = placeOfInterest[indexPath.row]
                }
            }
        }
    }


}

extension P0IsTableViewController: UITableViewDelegate {
    
}

extension P0IsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeOfInterest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "PoiCell", for: indexPath) as?
        POITableTableViewCell else { return UITableViewCell()}
        self.tableView = tableView
        let poi = placeOfInterest[indexPath.row]
        cell.poi = poi
        print("glad")
       return cell
    }
}

extension P0IsTableViewController: AddPOIDelegate {
    
    func poiWAsAdded(_ poi: POI) {
        placeOfInterest.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
