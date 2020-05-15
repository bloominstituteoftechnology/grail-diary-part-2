//
//  AddPOIViewController.swift
//  Grail Diary
//
//  Created by Rebecca Overare on 5/14/20.
//  Copyright © 2020 Rebecca Overare. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func addPOI(POI: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var clue1TextField: UITextField!
    
    @IBOutlet weak var clue2TextField: UITextField!
    
    @IBOutlet weak var clue3TextField: UITextField!
    
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        guard let location = locationTextField.text,
            let country = countryTextField.text else { return }
        
        var clues: [String] = []
        
        if let clue1 = clue1TextField.text,
            clue1 != "" {
            clues.append(clue1)
        }
        if let clue2 = clue2TextField.text,
            clue2 != "" {
            clues.append(clue2)
        }
        if let clue3 = clue3TextField.text,
            clue3 != "" {
            clues.append(clue3)
        }
        
        let poi = POI(location: location, country: country, clues: clues)
        
        delegate?.addPOI(POI: poi)
        
    }
    
    
    
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
}
