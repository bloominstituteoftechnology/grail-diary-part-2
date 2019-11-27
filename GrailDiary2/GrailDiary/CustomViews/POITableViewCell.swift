//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Bobby Keffury on 7/30/19.
//  Copyright © 2019 Bobby Keffury. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    // poi variable of type POI that was passed in earlier from the tableViewController.
    var poi: POI? {
        // Calls updateViews when the poi is filled.
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        // Make sure the poi exists or else return.
        guard let poi = poi else { return }
        
        // Sets the location and country labels to the poi's country and location aspects respectively.
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        // Sets the cluesTextLabel equal to the string that passes in the count of clues from the poi.
        cluesCountLabel.text = "\(poi.clues.count) clues"
        
    }

}
