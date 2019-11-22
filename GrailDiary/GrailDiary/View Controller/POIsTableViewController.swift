//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by LaFleur on 11/22/19.
//  Copyright © 2019 David Schwinne. All rights reserved.
//

import UIKit


class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var POIs: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let POIVC = segue.destination as? POIDetailViewController {
                POIVC.poi = POIs[indexPath.row]
            }
        }
    }

}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = POIs[indexPath.row]
        cell.poi = poi
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {

    func POIWasAdded(_ poi: POI) {
        POIs.append(poi)
        
        tableView.reloadData()
    }
}

