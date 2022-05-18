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

} //End of class

extension POIsTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        poiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
} //End of extension
