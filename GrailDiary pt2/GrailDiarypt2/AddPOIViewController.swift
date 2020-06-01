//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Craig Belinfante on 5/28/20.
//  Copyright © 2020 Craig Belinfante. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var Location: UITextField!
    @IBOutlet weak var Country: UITextField!
    @IBOutlet weak var Clue1: UITextField!
    @IBOutlet weak var Clue2: UITextField!
    @IBOutlet weak var Clue3: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    @IBAction func cancelTapped(_ sender: Any) {
            dismiss(animated: true, completion: nil)
    
    }
    @IBAction func saveTapped(_ sender: Any) {
        guard let location = Location.text, let country = Country.text else {
            dismiss(animated: true, completion: nil)
            return
        }
        if let clue1 = Clue1.text, let clue2 = Clue2.text, let clue3 = Clue3.text {
            
        let poi = POI(location: location, country: country, clues: [clue1, clue2, clue3])
            
        
        delegate?.poiWasAdded(poi)
        }
    }
        
    
}



