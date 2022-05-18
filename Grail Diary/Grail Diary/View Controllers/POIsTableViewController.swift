//
//  ViewController.swift
//  Grail Diary
//
//  Created by Waseem Idelbi on 5/13/22.
//

import UIKit

class POIsTableViewController: UIViewController {
    
//MARK: - Properties
    var poiList: [POI] = []
    
//MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
//MARK: - Methods
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            let addPOIVC = segue.destination as! AddPOIViewController
            addPOIVC.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let index = tableView.indexPathForSelectedRow?.row,
               let poiDetailVC = segue.destination as? POIDetailViewController {
                let selectedPOI = poiList[index]
                poiDetailVC.poi = selectedPOI
            }
        }
    }

} //End of class

extension POIsTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        poiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentPOI = poiList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as! POITableViewCell
        cell.poi = currentPOI
        return cell
    }

} //End of extension

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        self.poiList.append(poi)
        dismiss(animated: true)
        self.tableView.reloadData()
    }
} //End of extension
