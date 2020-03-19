//
//  POIDetailViewController.swift
//  GrailDiaryApp
//
//  Created by Cameron Collins on 3/19/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    //Variable Initialization
    var poi: POI?
    
    //Objects| Outlet
    @IBOutlet weak var objectLabelLocation: UILabel!
    @IBOutlet weak var objectLabelCountry: UILabel!
    @IBOutlet weak var objectLabelClues: UILabel!
    @IBOutlet weak var objectTextViewClues: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let myPOI = poi else {
            return
        }
        objectLabelLocation.text = myPOI.location
        objectLabelCountry.text = myPOI.country
        //objectLabelClues.text = myPOI.clues
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
