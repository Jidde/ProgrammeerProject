//
//  Statistics.swift
//  TrackYourTravels
//
//  Created by Jidde Koekoek on 06/06/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import Foundation

class Statistics {

    /// http://stackoverflow.com/questions/24723431/swift-days-between-two-nsdates
    func daysBetweenDates(startDate: String) -> Int {
        
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        
        let d = dateFormatter.dateFromString(startDate)
        
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components([.Day], fromDate: d!, toDate: currentDate, options: [])
        
        return components.day
    }
    
    func timeBetweenDates(date1: String, date2: String) -> Int {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        
        let d1 = dateFormatter.dateFromString(date1)
        let d2 = dateFormatter.dateFromString(date2)
        
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components([.Minute], fromDate: d1!, toDate: d2!, options: [])
        
        return components.minute
    }
    
    
    
    
    
    
    
}







