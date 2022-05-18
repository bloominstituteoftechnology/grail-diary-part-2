//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by Waseem Idelbi on 5/17/22.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
//MARK: - Properties
    var poi: POI? {
        didSet {
            updateViews()
        }
    }

//MARK: - IBOutlets
    @IBOutlet weak var locationLabel:   UILabel!
    @IBOutlet weak var countryLabel:    UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
//MARK: - Methods
    func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text   = poi.location
        countryLabel.text    = poi.country
        cluesCountLabel.text = "\(poi.clues.count) clues"
    }
    
}
