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
    var poiArray : [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == addPOIModalSegue {
            if let addPoiVC = segue.destination as? AddPOIViewController {
                addPoiVC.delegate = self
            }
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiArray.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    
}
