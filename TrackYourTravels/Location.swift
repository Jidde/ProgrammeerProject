//
//  Location.swift
//  TrackYourTravels
//
//  Created by Jidde Koekoek on 02/06/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class Location: CLLocationManager, CLLocationManagerDelegate {
    
    var locations = [MKPointAnnotation]()
    
    lazy var locationManager: CLLocationManager! = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        
        return manager
        
    }()
}

