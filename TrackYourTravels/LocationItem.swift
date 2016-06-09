//
//  LocationItem.swift
//  TrackYourTravels
//
//  Created by Jidde Koekoek on 09/06/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import Foundation

class LocationItem {
    
    var timestamp: String
    var latitude: Double
    var longitude: Double
    var velocity: Double
    
    init (timestamp: String, latitude: Double, longitude: Double, velocity: Double) {
        self.latitude = latitude
        self.longitude = longitude
        self.timestamp = timestamp
        self.velocity = velocity
    }
}