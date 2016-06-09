//
//  UserSettings.swift
//  TrackYourTravels
//
//  Created by Jidde Koekoek on 01/06/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import Foundation


class UserSettings {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    
    var runOrBike = 0
    var carOrPT = 0
    var accuracy = 0
    
    func setValueBike (slow: Int) {
        runOrBike = slow
    }
    
    func setValueCar (fast: Int) {
        carOrPT = fast
    }
    
    func setValueAccuracy (acc: Int) {
        accuracy = acc
    }
    
    func returnValues () ->  (Int, Int, Int) {
        return (runOrBike, carOrPT, accuracy)
    }
    
}


