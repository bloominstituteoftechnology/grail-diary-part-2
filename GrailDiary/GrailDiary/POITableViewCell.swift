//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Craig Belinfante on 5/31/20.
//  Copyright © 2020 Craig Belinfante. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
    guard let unwrappedPOI = poi else {
       return
     }
    locationLabel.text = unwrappedPOI.location
    countryLabel.text = unwrappedPOI.country
    viewsLabel.text = "\(unwrappedPOI.clues.count) clues"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
