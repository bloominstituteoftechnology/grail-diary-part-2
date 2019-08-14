//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Jordan Christensen on 8/14/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    var grail: GrailClue? {
        didSet{
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let grail = grail else { return }
        locationLabel.text = grail.location
        countryLabel.text = grail.country
        if (grail.clues.count == 1) {
            cluesLabel.text = "\(grail.clues.count) clue"
        } else {
            cluesLabel.text = "\(grail.clues.count) clues"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
