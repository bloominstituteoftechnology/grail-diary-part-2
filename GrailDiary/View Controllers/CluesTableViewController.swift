//
//  CluesTableViewController.swift
//  GrailDiary
//
//  Created by Jordan Christensen on 8/13/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

class CluesTableViewController: UIViewController {
    
    var grailList: [GrailClue] = []

    @IBOutlet weak var grailTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        grailTableView.dataSource = self
        
        grailList.append(GrailClue(location: "Utah", country: "USA", clues: ["go left", "go right"]))
        grailList.append(GrailClue(location: "Utah", country: "USA", clues: ["go right", "go left"]))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let newGrailVC = segue.destination as? NewGrailViewController {
                newGrailVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let grailDetailVC = segue.destination as? GrailDetailViewController {
                guard let indexPath = grailTableView.indexPathForSelectedRow else { return }
                grailDetailVC.grail = grailList[indexPath.row]
            }
        }
    }

}

extension CluesTableViewController: AddGrail {
    func grailWasCreated(_ grail: GrailClue) {
        grailList.append(grail)
        dismiss(animated: true, completion: nil)
        grailTableView.reloadData()
    }
}

extension CluesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grailList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GrailCell", for: indexPath) as? GrailTableViewCell else { return UITableViewCell() }
        
        cell.grail = grailList[indexPath.row]
        
        
        return cell
    }
}
