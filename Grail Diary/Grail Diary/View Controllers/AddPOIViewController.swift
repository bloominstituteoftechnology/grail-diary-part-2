//
//  AddPOIViewController.swift
//  Grail Diary
//
//  Created by Waseem Idelbi on 5/17/22.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
//MARK: - IBOutlets
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
//MARK: - Properties
    var delegate: AddPOIDelegate?
    
//MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
              let country  = countryTextField.text else { return }
        
        var newPOI = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text { newPOI.clues.append(clue1) }
        if let clue2 = clue2TextField.text { newPOI.clues.append(clue2) }
        if let clue3 = clue3TextField.text { newPOI.clues.append(clue3) }
        
        delegate?.poiWasAdded(newPOI)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
//MARK: - Methods
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let text = textField.text,
              !text.isEmpty else { return false }
        
        switch textField {
            
        case locationTextField:
            countryTextField.becomeFirstResponder()
            
        case countryTextField:
            clue1TextField.becomeFirstResponder()
            
        case clue1TextField:
            clue2TextField.becomeFirstResponder()
            
        case clue2TextField:
            clue3TextField.becomeFirstResponder()
            
        case clue3TextField:
            clue3TextField.resignFirstResponder()
            
        default:
            textField.resignFirstResponder()
        
        }
    }
    
} //End of extension
