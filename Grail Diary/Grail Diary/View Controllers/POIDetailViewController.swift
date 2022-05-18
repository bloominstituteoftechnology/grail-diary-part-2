//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Waseem Idelbi on 5/17/22.
//

import UIKit

class POIDetailViewController: UIViewController {
    
//MARK: - Properties
    var poi: POI?
    
//MARK: - IBOutlets
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
//MARK: - Methods
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // Setting up views
    func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text =  poi.country
        
        for clue in poi.clues {
            cluesTextView.text +=
"""

\(clue)
"""
            
        }
        
    }
    
}
