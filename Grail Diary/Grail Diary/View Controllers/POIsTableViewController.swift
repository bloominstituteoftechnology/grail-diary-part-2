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
        }
    }

} //End of class

extension POIsTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        poiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let currentPOI = poiList[indexPath.row]
        let cell = POITableViewCell()
        
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
