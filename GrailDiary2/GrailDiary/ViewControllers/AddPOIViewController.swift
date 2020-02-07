//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Bobby Keffury on 7/30/19.
//  Copyright © 2019 Bobby Keffury. All rights reserved.
//

import UIKit

// Protocol with an appropriate name that will be used later.
protocol AddPOIDelegate {
    // Function that will be required whenever the extension is made. Only a skeleton is needed here. In the extension, more functionality will be added.
    func poiWasAdded(_ poi: POI)
}

//BOSS
class AddPOIViewController: UIViewController {
    
    // Outlets from all the textFields
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    // Delegate variable of type AddPOIDelegate we will use later.
    var delegate: AddPOIDelegate?
    

    // When the view loads, the following happens.
    override func viewDidLoad() {
        super.viewDidLoad()

        // The delegates of each of the textFields are set to the view controller we're in.
        locationTextField.delegate = self
        countryTextField.delegate = self
        clue1TextField.delegate = self
        clue2TextField.delegate = self
        clue3TextField.delegate = self
    }
    
    // When the save button is tapped, the following happens.
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        
        // Setting new location and country variables equal to the text in their respective textFields and making sure they aren't empty or else we return. This also unwraps the data.
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        // new poi variable is set to a new POI model with the variables passed in from above. alse has a clues variable that is set to an empty array.
        var poi = POI(location: location, country: country, clues: [])
        
        // Setting and unwrapping the text in the clue1TextField and making sure it isnt empty. Then the following happens.
        if let clue1 = clue1TextField.text, !clue1.isEmpty {
            // Add the clue we just created to the clues array inside the poi we created above.
            poi.clues.append(clue1)
        }
        // Do the same for clue2 and clue3
        if let clue2 = clue2TextField.text, !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        if let clue3 = clue3TextField.text, !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        // The delegate's function is now called and the poi we just created was passed in.
        delegate?.poiWasAdded(poi)
        
    }
    
    // When the cancel button is tapped, the following happens.
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        // Dismiss the view controller.
        dismiss(animated: true, completion: nil)
    }

}

// Extension on the current viewController of type UITextFieldDelegate.
extension AddPOIViewController: UITextFieldDelegate {
    
    // Function to figure out what the textField's should do when return is hit.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // New text constant set to the textField's text and making sure it isnt empty. If true, do the following.
        if let text = textField.text, !text.isEmpty {
            // Switch allows you to change aspects of certain properties.
            switch textField {
                // In the case of the locationTextField (First Text Field), set the countryTextField as the first responder.
            case locationTextField:
                countryTextField.becomeFirstResponder()
                // Same as above for all the other textFields.
            case countryTextField:
                clue1TextField.becomeFirstResponder()
            case clue1TextField:
                clue2TextField.becomeFirstResponder()
            case clue2TextField:
                clue3TextField.becomeFirstResponder()
                // The default is to resign the first responder.
            default:
                textField.resignFirstResponder()
            }
        }
        // If the parameters arent met, return false. 
        return false
    }
    
}
