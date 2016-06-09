//
//  ThirdViewController.swift
//  TrackYourTravels
//
//  Created by Jidde Koekoek on 02/06/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import UIKit
import CoreLocation

class ThirdViewController: UIViewController {
    
    @IBOutlet var runOrBike: UISegmentedControl!
    @IBOutlet var CarOrPT: UISegmentedControl!
    @IBOutlet var accuracyLevel: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Handler for segmented control.
    @IBAction func runOrBikeHandler(sender: AnyObject) {
        UserSettings().setValueBike(sender.selectedIndex)
    }
    
    /// Handler for segmented control.
    @IBAction func carOrPTHandler(sender: AnyObject) {
        UserSettings().setValueCar(sender.selectedIndex)
    }
    
    /// Ray Wenderlich: Background App Refresh.
    @IBAction func accuracyHandler(sender: AnyObject) {
        
        let accuracyValues = [
            kCLLocationAccuracyBest,
            kCLLocationAccuracyNearestTenMeters,
            kCLLocationAccuracyHundredMeters,
            kCLLocationAccuracyKilometer]
        
            
        // locationManager.desiredAccuracy = accuracyValues[sender.selectedSegmentIndex];
        
    }

}
