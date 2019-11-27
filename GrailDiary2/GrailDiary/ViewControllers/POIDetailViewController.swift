//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Bobby Keffury on 7/30/19.
//  Copyright © 2019 Bobby Keffury. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    // Outlets for each of the properties that need to be changed.
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    // poi variable that was filled previously.
    var poi: POI?
    
    // When the view loads, the following happens.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UpdateViews function is called.
        updateViews()
    }
    
    // UpdateViews function that does the following.
    private func updateViews() {
        // Make sure the poi exists or else return.
        guard let poi = poi else { return }
        
        // Setting the location label's text to the poi's location.
        locationLabel.text = poi.location
        // Setting the country label's text to the poi's country.
        countryLabel.text = poi.country
        // New clues text variable set to an empty string
        var cluesText = ""
        // for each clue in the clue array that come with the poi, do the following.
        for clue in poi.clues {
            // The cluesText is set to the string. Inside the string is a bullet point, the clue, and a break in the line. (Bulletpoint)
            cluesText += "•  \(clue)\n"
        }
        
        // Setting the cluesTextView's text to the cluesText from above.
        cluesTextView.text = cluesText
        
    }

}
