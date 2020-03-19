//
//  POIstableViewController.swift
//  GrailDiaryApp
//
//  Created by Cameron Collins on 3/17/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

class POIstableViewController: UIViewController {
    
    //Objects
    @IBOutlet weak var objectTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        objectTableView.dataSource = self
    }
    
    //Variable Initialization
    var poi: [POI] = []
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueIdentifier = segue.identifier {
            switch(segueIdentifier) {
            case "AddPOIModalSegue":
                guard let segueDestination = segue.destination as? AddPOIViewController else {
                    return
                }
                segueDestination.delegate = self
                
            case "ShowPOIDetailSegue":
                guard let segueDestination = segue.destination as? POIDetailViewController else {
                    return
                }
                //segueDestination.delegate = self
                
            default: break
                
            }
        }
    }
    

}

extension POIstableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = objectTableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        
        return cell
    }
}

extension POIstableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        self.poi.append(poi)
        dismiss(animated: true, completion: nil)
        objectTableView.reloadData()
    }
}
