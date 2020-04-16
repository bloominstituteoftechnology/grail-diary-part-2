//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Brian Rouse on 4/16/20.
//  Copyright © 2020 Brian Rouse. All rights reserved.
//

import UIKit

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var hometown: UITextField!
    
    @IBOutlet weak var clue1: UITextField!
    
    @IBOutlet weak var clue2: UITextField!
    
    @IBOutlet weak var clue3: UITextField!
    
    
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
    }
    
    
    @IBAction func save(_ sender: UIBarButtonItem) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
