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
    var locations = [MKPointAnnotation]()
    
    // RayWenderlich: Background App Refresh
    lazy var locationManager: CLLocationManager! = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        
        return manager
        
    }()
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK: - CLLocationManagerDelegate
    
    /// RayWenderlich: Background App Refresh
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        
        // Add another annotation to the map.
        let annotation = MKPointAnnotation()
        annotation.coordinate = newLocation.coordinate
        
        // Also add to our map so we can remove old values later
        locations.append(annotation)
        
        // Remove values if the array is too big
//        while locations.count > 100 {
//            let annotationToRemove = locations.first!
//            locations.removeAtIndex(0)
//            
//            // Also remove from the map
//            mapView.removeAnnotation(annotationToRemove)
//        }
        
        if UIApplication.sharedApplication().applicationState == .Active {
            mapView.showAnnotations(locations, animated: true)
            
            let latitude = newLocation.coordinate.latitude
            let longitude = newLocation.coordinate.longitude
            let timestamp = newLocation.timestamp
            let speed = newLocation.speed
            
            print("Using the application: \(latitude)")
            print("Using the application: \(longitude)")
            print("Using the application: \(timestamp)")
            print("Using the application: \(speed)")
            
        } else {
            NSLog("App is backgrounded. New location is %@", newLocation)
            
            let latitude = newLocation.coordinate.latitude
            let longitude = newLocation.coordinate.longitude
            let timestamp = newLocation.timestamp
            let speed = newLocation.speed
            
            print("Background location update: \(latitude)")
            print("Background location update: \(longitude)")
            print("Background location update: \(timestamp)")
            print("Background location update: \(speed)")
        }
    }
}


extension FirstViewController: MKMapViewDelegate {
    
    
    
    
    
}










