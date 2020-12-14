//
//  AddPOIViewController.swift
//  Grail Diary
//
//  Created by James McDougall on 12/13/20.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clueOneTextField: UITextField!
    @IBOutlet weak var clueTwoTextField: UITextField!
    @IBOutlet weak var clueThreeTextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        if let clueOne = clueOneTextField.text,
           !clueOne.isEmpty {
            poi.clues.append(clueOne)
        }
        
        if let clueTwo = clueTwoTextField.text,
           !clueTwo.isEmpty {
            poi.clues.append(clueTwo)
        }
        
        if let clueThree = clueThreeTextField.text,
           !clueThree.isEmpty {
            poi.clues.append(clueThree)
        }
        
        delegate?.poiWasAdded(poi)
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
                clueOneTextField.becomeFirstResponder()
            case clueOneTextField:
                clueTwoTextField.becomeFirstResponder()
            case clueTwoTextField:
                clueThreeTextField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        return false
    }
    
}
