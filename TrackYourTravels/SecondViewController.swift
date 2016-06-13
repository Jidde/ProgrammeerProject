//
//  SecondViewController.swift
//  TrackYourTravels
//
//  Created by Jidde Koekoek on 30/05/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import UIKit
import MapKit
import CoreGraphics

class SecondViewController: UIViewController {
    
    @IBOutlet var periodSetter: UISegmentedControl!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let statistics = Statistics()
        statistics.dateToday("06-13-2016 10:11:27")
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let locations = DatabaseManager.sharedInstance.readAllFromDatabase()

        for location in locations {
            label.text = location.timestamp
            print(location.timestamp, location.velocity, location.latitude, location.longitude)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

