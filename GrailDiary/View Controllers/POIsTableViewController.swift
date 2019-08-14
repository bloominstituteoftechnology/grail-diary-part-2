//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Jordan Christensen on 8/13/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    var grailList: [POI] = []

    @IBOutlet weak var grailTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        grailTableView.dataSource = self
        
        grailList.append(POI(location: "Utah", country: "USA", clues: ["go left", "go right"]))
        grailList.append(POI(location: "Utah", country: "USA", clues: ["go right", "go left"]))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let newGrailVC = segue.destination as? AddPOIViewController {
                newGrailVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let grailDetailVC = segue.destination as? POIDetailViewController {
                guard let indexPath = grailTableView.indexPathForSelectedRow else { return }
                grailDetailVC.grail = grailList[indexPath.row]
            }
        }
    }

}

extension POIsTableViewController: AddGrail {
    func POIWasCreated(_ grail: POI) {
        grailList.append(grail)
        dismiss(animated: true, completion: nil)
        grailTableView.reloadData()
    }
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grailList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GrailCell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        cell.grail = grailList[indexPath.row]
        
        
        return cell
    }
}
