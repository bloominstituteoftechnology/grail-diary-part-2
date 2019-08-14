//
//  NewGrailViewController.swift
//  GrailDiary
//
//  Created by Jordan Christensen on 8/13/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

protocol AddGrail {
    func grailWasCreated(_ grail: GrailClue)
}

class NewGrailViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate: AddGrail?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
    }
    
    @IBAction func savePressed(_ sender: Any) {
         guard let location: String = locationTextField.text, let country = countryTextField.text, !location.isEmpty, !country.isEmpty else { return }
        
        var grail = GrailClue(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text, !clue1.isEmpty {
            grail.clues.append(clue1)
        }
        if let clue2 = clue2TextField.text, !clue2.isEmpty {
            grail.clues.append(clue2)
        }
        if let clue3 = clue3TextField.text, !clue3.isEmpty {
            grail.clues.append(clue3)
        }
        
        delegate?.grailWasCreated(grail)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    */

}
