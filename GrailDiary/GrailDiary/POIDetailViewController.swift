//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Gladymir Philippe on 5/25/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var poiTextView: UITextView!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var clueText = ""
        for clue in poi.clues {
            clueText += ". \(clue)\n"
        }
        
        poiTextView.text = clueText
    }
}
