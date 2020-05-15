//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Rebecca Overare on 5/14/20.
//  Copyright © 2020 Rebecca Overare. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    var poi: POI?
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var country: UILabel!
    
    @IBOutlet weak var cluesText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        
        if let poi = poi {
        
            self.location.text = poi.location
            self.country.text = poi.country
            self.country.text = poi.country
            self.cluesText.text = poi.clues.joined(separator: ".")
        }
    }
}
