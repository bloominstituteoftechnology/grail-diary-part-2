//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Craig Belinfante on 5/31/20.
//  Copyright © 2020 Craig Belinfante. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var detailedLocation: UILabel!
    @IBOutlet weak var detailedCountry: UILabel!
    @IBOutlet weak var detailedTextView: UITextView!
    
    var poi: POI?
    
    private func updateViews() {
        guard let poi = poi else { return }
          print("update views in POIDetailViewController is working")
          detailedLocation.text = poi.location
          detailedCountry.text = poi.country
          var cluesText = ""
          for clue in poi.clues {
            cluesText += "∙ \(clue)\n"
          }
          detailedTextView.text = cluesText
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
