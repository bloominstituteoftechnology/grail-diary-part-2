//
//  POITableViewCell.swift
//  GrailDiaryApp
//
//  Created by Cameron Collins on 3/19/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    //Variable Initialization
    var poi: POI? { didSet {
        updateViews(poi)
        print("Poi was set")
        }
    }
    
    //Objects| Outlet
    @IBOutlet weak var objectLabelLocation: UILabel!
    @IBOutlet weak var objectLabelCountry: UILabel!
    @IBOutlet weak var objectLabelClues: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateViews(poi)
        
    }
    
    //Functions
    private func updateViews(_ poi: POI?) {
        if let myPoi = poi {
            objectLabelLocation.text = myPoi.location
            objectLabelCountry.text = myPoi.country
            objectLabelClues.text = "\(myPoi.clues[0]), \(myPoi.clues[1]), \(myPoi.clues[2])"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
