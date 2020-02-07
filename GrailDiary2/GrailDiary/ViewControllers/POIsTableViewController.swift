//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Bobby Keffury on 7/30/19.
//  Copyright © 2019 Bobby Keffury. All rights reserved.
//

import UIKit

//INTERN
class POIsTableViewController: UIViewController {

    // Outlet for the tableView we added to the viewController.
    @IBOutlet weak var tableView: UITableView!
    
    // Array of POIs set to an empty array that we will fill and use later.
    var POIs: [POI] = []

    // This mark allows us to easily move from section to section in the above heirarchy ^^^^
    // MARK: - Navigation

    //Function to make the segue work and add things to the waiting view controller when the segue happens.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the segue's identifier is AddPOIModalSegue, do the following.
        if segue.identifier == "AddPOIModalSegue" {
            // Setting the new constant equal to the segue's destination as the ViewController that we have set up. If that is able to happen, the following occurs.
            if let addPOIVC = segue.destination as? AddPOIViewController {
                // The new view controller's delegate is set to this view controller. That makes this viewController the intern and the new viewController the boss in our delegation heirarchy.
                addPOIVC.delegate = self
            }
            // If the segue's identifier is not the one from above and it is this one, do the following.
        } else if segue.identifier == "ShowPOIDetailSegue" {
            // Setting the new indexPath constant equal to the selected row in the tableView.
            if let indexPath = tableView.indexPathForSelectedRow,
                // Setting the new poiDetailVC constant equal to the segue's destination as the POIDetailViewController we have set up. If both are able to happen then do the following.
                let poiDetailVC = segue.destination as? POIDetailViewController {
                // The poi in the detailVC we just created is equal to the poi that we clicked on from the tableView.
                poiDetailVC.poi = POIs[indexPath.row]
                
            }
        }
    }
 

}

// Extension on the View controller we are in to implement numberOfRows and cellForRow because we didnt make this a tableViewController where these functions are already loaded.
extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // For the number of rows in the table view, we load only the amount of pois we have in our array.
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Setting the cell equal to the same cell we added in the storyboard as the custom cell we will make changes to in our customViews folder. If it doesnt work, return a blank cell. Make sure you copy and past the string below.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        // Creating a new POI variable that is set to the specific POI that the cell contains.
        let POI = POIs[indexPath.row]
        // setting the cell's poi to the POI we just created. Kind of like a segue.
        cell.poi = POI
        
        // After this is done, we will return the cell to be shown.
        return cell
        
    }
}

// Extension on this view controller of type AddPOIDelegate.
extension POIsTableViewController: AddPOIDelegate {
    // Function that conforms to the delegate that takes in a poi as an argument.
    func poiWasAdded(_ poi: POI) {
        // Take the poi that was passed in and append it to the array we set up earlier.
        POIs.append(poi)
        // Dismiss the tableView
        dismiss(animated: true, completion: nil)
        // Reload the tableView's data to reflect the new information.
        tableView.reloadData()
    }
}
