//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Jordan Christensen on 8/13/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var grail: GrailClue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let grail = grail else { return }
        countryLabel.text = grail.country
        locationLabel.text = grail.location
        self.title = grail.location
        for x in grail.clues {
            cluesTextView.text = "\(cluesTextView.text ?? "")\(x)\n"
        }
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
