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
    
    
    @IBAction func runOrBikeHandler(sender: AnyObject) {
        
    }
    
    
    @IBAction func carOrPTHandler(sender: AnyObject) {
        
    }
    
    /// https://www.raywenderlich.com/92428/background-modes-ios-swift-tutorial
    @IBAction func accuracyHandler(sender: AnyObject) {
        
        let accuracyValues = [
            kCLLocationAccuracyBest,
            kCLLocationAccuracyNearestTenMeters,
            kCLLocationAccuracyHundredMeters,
            kCLLocationAccuracyKilometer]
        
        // locationManager.desiredAccuracy = accuracyValues[sender.selectedSegmentIndex];
        
    }

}
