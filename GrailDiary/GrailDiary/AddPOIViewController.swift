//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Craig Belinfante on 5/31/20.
//  Copyright © 2020 Craig Belinfante. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {

    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var clue1: UITextField!
    @IBOutlet weak var clue2: UITextField!
    @IBOutlet weak var clue3: UITextField!
    
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let unwrappedLocation = location.text, let unwrappedCountry = country.text else {
            return
        }
        var poi = POI(location: unwrappedLocation, country: unwrappedCountry)
        
        if let unwrappedClue1 = clue1.text { poi.clues.append(unwrappedClue1)
        }
        if let unwrappedClue2 = clue2.text {
            poi.clues.append(unwrappedClue2) }
        if let unwrappedClue3 = clue3.text { poi.clues.append(unwrappedClue3)
            }
        delegate?.poiWasAdded(poi)
        
        
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

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case location: country.becomeFirstResponder()
            case country: clue1.becomeFirstResponder()
            case clue1: clue2.becomeFirstResponder()
            case clue2: clue3.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
            
        }
    return false
    }
}

