//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by LaFleur on 11/22/19.
//  Copyright © 2019 David Schwinne. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    var POIs: [POI] = []
    
    
    
        @IBOutlet weak var locationLabel: UILabel!
        @IBOutlet weak var countryLabel: UILabel!
        @IBOutlet weak var cluesLabel: UILabel!
        
        var poi: POI? {
            didSet {
                self.updateViews()
            }
        }

        private func updateViews() {
            guard let poi = poi else { return }
            
            locationLabel.text = poi.location
            countryLabel.text = poi.country
            cluesLabel.text = "\(poi.clues.count) clues"
        }
    }
