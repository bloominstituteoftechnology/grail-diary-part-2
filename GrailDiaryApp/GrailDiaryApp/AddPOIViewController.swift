//
//  AddPOIViewController.swift
//  GrailDiaryApp
//
//  Created by Cameron Collins on 3/19/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit


protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}


class AddPOIViewController: UIViewController, AddPOIDelegate {
    
    //Variable Initialization
    //var previousController: POIstableViewController?
    var delegate: POIstableViewController?
    
    
    //Objects| Outlet
    @IBOutlet weak var objectLocationTextField: UITextField!
    @IBOutlet weak var objectCountryTextField: UITextField!
    @IBOutlet weak var objectClue1TextField: UITextField!
    @IBOutlet weak var objectClue2TextField: UITextField!
    @IBOutlet weak var objectClue3TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objectLocationTextField.delegate = self
        objectCountryTextField.delegate = self
        objectClue1TextField.delegate = self
        objectClue2TextField.delegate = self
        objectClue3TextField.delegate = self
    }
    
    //Objects| Actions
    @IBAction func saveTapped(_ sender: Any) {
        guard let location = objectLocationTextField.text, let country = objectCountryTextField.text else {
            dismiss(animated: true, completion: nil)
            return
        }
        
        if let clue1 = objectClue1TextField.text, let clue2 = objectClue2TextField.text, let clue3 = objectClue3TextField.text {
            
            let poi = POI(location: location, country: country, clues: [clue1, clue2, clue3])
            
            //delegate?.poiWasAdded(poi)
            delegate?.poi.append(poi)
            delegate?.objectTableView.reloadData()
            dismiss(animated: true, completion: nil)
            
        }
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //Functions
    func poiWasAdded(_ poi: POI) {
        //Nothing
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
        if let myText = textField.text {
            if !myText.isEmpty {
                switch(textField) {
                case objectLocationTextField: objectLocationTextField.becomeFirstResponder()
                    
                case objectCountryTextField:
                objectCountryTextField.becomeFirstResponder()
                    
                case objectClue1TextField:
                objectClue1TextField.becomeFirstResponder()
                    
                case objectClue2TextField:
                objectClue2TextField.becomeFirstResponder()
                    
                case objectClue3TextField:
                objectClue3TextField.becomeFirstResponder()
                default: break
                
                }
            }
        }
    return true
    }
}
