//
//  ViewController.swift
//  Grail Diary
//
//  Created by Jason Hoover on 5/12/20.
//  Copyright © 2020 Jason Hoover. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    
    
    var pointOfInterests: [POI] = [POI(location: "France", POI: "Paris", clues: ["The Eiffel Tower was a temporary construction", "There’s only one STOP sign in the entire city of Paris", "The oldest bridge in Paris is the Pont Neuf (New Bridge)"])]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

