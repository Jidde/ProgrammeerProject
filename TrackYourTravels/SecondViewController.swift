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
    
    var timestampArray: Array<LocationItem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let locations = DatabaseManager.sharedInstance.readAllFromDatabase()

        for location in locations {
            label.text = location.timestamp
            //print(location.timestamp, location.velocity, location.latitude, location.longitude)
            
            let statistics = Statistics()
            if statistics.daysBetweenDates(location.timestamp) == 0 {
                timestampArray.append(location)
            }
        }
        print(timestampArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

