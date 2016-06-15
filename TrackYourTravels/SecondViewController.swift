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
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        var timestampArray: Array<LocationItem> = []
        let locations = DatabaseManager.sharedInstance.readAllFromDatabase()

        for location in locations {
            label.text = location.timestamp
            //print(location.timestamp, location.velocity, location.latitude, location.longitude)
            
            let statistics = Statistics()
            if statistics.daysBetweenDates(location.timestamp) == 0 {
                timestampArray.append(location)
            }
        }
        //print(timestampArray)
        var totalTime = 0
        
        for index in 0...(timestampArray.count - 2) {
            let statistics = Statistics()
            let date1 = timestampArray[index].timestamp
            let date2 = timestampArray[index + 1].timestamp
            let minute = statistics.timeBetweenDates(date1, date2: date2)
            
            if minute < 30 {
                totalTime = totalTime + statistics.timeBetweenDates(date1, date2: date2)
            }
            
            print(date1)
            print(date2)
            print(minute)
            print(timestampArray[index].velocity)
            print(timestampArray[index].latitude)
            print(timestampArray[index].longitude)
        }
        print(totalTime)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}







