//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Gladymir Philippe on 5/25/20.
//  Copyright © 2020 Gladymir Philippe. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWAsAdded(_ poi: POI)
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
        locationTextField.delegate = self
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        var poi = POI(location: location, country: country, clues: [])
        print(poi)
        if let clue1 = clue1TextField.text,
            !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        if let clue2 = clue2TextField.text,
            !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        if let clue3 = clue3TextField.text,
            !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWAsAdded(poi)
        print("the update views is working inside poi")
        
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,
            !text.isEmpty {
            switch textField {
            case locationTextField:
                countryTextField.becomeFirstResponder()
            case countryTextField:
                clue1TextField.becomeFirstResponder()
            case clue1TextField:
                clue2TextField.becomeFirstResponder()
            case clue2TextField:
                clue3TextField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        return false
    }
}
