//
//  POITableTableViewCell.swift
//  GrailDiary
//
//  Created by Gladymir Philippe on 5/25/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit

class POITableTableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }

    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count) clues"
        
    }
}
