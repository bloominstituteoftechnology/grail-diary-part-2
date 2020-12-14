//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by James McDougall on 12/13/20.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    let addPOIModalSegue = "AddPOIModalSegue"
    let showPOIDetailSegue = "ShowPOIDetailSegue"
    let clueCell = "ClueCell"
    var poiArray : [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == addPOIModalSegue {
            if let addPoiVC = segue.destination as? AddPOIViewController {
                addPoiVC.delegate = self
            } else if segue.identifier == showPOIDetailSegue {
                if let indexPath = tableView.indexPathForSelectedRow,
                   let poiDetailVC = segue.destination as? POIDetailViewController {
                    poiDetailVC.poi = poiArray[indexPath.row]
                }
            }
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: clueCell, for: indexPath) as? POITableViewCell else { return UITableViewCell()}
        
        let poi = poiArray[indexPath.row]
        cell.poi = poi
        
        return cell
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiArray.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    
}
