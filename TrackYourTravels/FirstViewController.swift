//
//  FirstViewController.swift
//  TrackYourTravels
//
//  Created by Jidde Koekoek on 30/05/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate {
    
    // RayWenderlich: Background App Refresh
    var locationss = [MKPointAnnotation]()
    
    // RayWenderlich: Background App Refresh, instance of CLLocation manager.
    lazy var locationManager: CLLocationManager! = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.distanceFilter = 100
        manager.delegate = self
        manager.pausesLocationUpdatesAutomatically = true
        manager.requestAlwaysAuthorization()
        
        return manager
    }()
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update significant changes in location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startMonitoringSignificantLocationChanges()
        }
        // Error handling with UIAlertView: http://zappdesigntemplates.com/uialertcontroller-ios-8-uialertview-in-swift/
        else {
            let alertView = UIAlertController(title: "Error", message: "No permission to use your location :-(", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

// MARK: - CLLocationManagerDelegate
    /// Did update locations behaviour.
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let annotation = MKPointAnnotation()
        let location = (locations.last?.coordinate)!
        annotation.coordinate = location
        
        locationss.append(annotation)
        
        // Update map in all states and push to database.
        if UIApplication.sharedApplication().applicationState == .Active ||
        UIApplication.sharedApplication().applicationState == .Background ||
        UIApplication.sharedApplication().applicationState == .Inactive {
            
            mapView.showAnnotations(locationss, animated: true)
            
            let latitude = location.latitude
            let longitude = location.longitude
            let stamp = locations.last!.timestamp
            let speed = locations.last!.speed
            
            DatabaseManager.sharedInstance.writeToDatabase(stamp, lat: latitude, long: longitude, speed: speed)
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        
        
        let alertView = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alertView, animated: true, completion: nil)
    }
    
}










