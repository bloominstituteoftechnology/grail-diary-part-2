//
//  POITableViewController.swift
//  GrailDiary
//
//  Created by Craig Belinfante on 5/31/20.
//  Copyright © 2020 Craig Belinfante. All rights reserved.
//

import UIKit

class POITableViewController: UIViewController, UITableViewDelegate {

    var poiArray: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var poiTableView: UITableView!
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "AddPOIModalSegue" {
        if let destinationAddVC = segue.destination as? AddPOIViewController {
          destinationAddVC.delegate = self
        }
      } else if segue.identifier == "ShowPOIDetailSegue" {
        if let destinationShowVC = segue.destination as? POIDetailViewController ,
        let indexPath = poiTableView.indexPathForSelectedRow {
          let poiInfo = poiArray[indexPath.row]
          destinationShowVC.poi = poiInfo
        }
        }
    }

}

extension POITableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "poiTableView", for: indexPath) as? POITableViewCell else {
            return UITableViewCell()
        }
        
        self.poiTableView = tableView
        let poi = poiArray[indexPath.row]
        cell.poi = poi
        return cell
    }
    
    
}

extension POITableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiArray.append(poi)
        poiTableView.reloadData()
    dismiss(animated: true, completion: nil)
    }
    
    
}

