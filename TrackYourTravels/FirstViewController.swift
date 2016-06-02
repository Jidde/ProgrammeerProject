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
    
    var locations = [MKPointAnnotation]()
    
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
        } else {
            NSLog("App is backgrounded. New location is %@", newLocation)
            let latitude = newLocation.coordinate.longitude
            let longitude = newLocation.coordinate.longitude
            let timestamp = newLocation.timestamp
            let speed = newLocation.speed
            
            
        }
    }
}


extension FirstViewController: MKMapViewDelegate {
    
    
    
    
    
}










