//
//  Statistics.swift
//  TrackYourTravels
//
//  Created by Jidde Koekoek on 06/06/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import Foundation

class Statistics {
    
    let currentDate = NSDate()
    let dateFormatter = NSDateFormatter()
    
    func daysBetweenDates(startDate: String, endDate: NSDate) -> Int {
        
        let d = dateFormatter.dateFromString(startDate)
        
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components([.Day], fromDate: d!, toDate: endDate, options: [])
        
        return components.day
    }
    
    
        // is date in database higher than the start of current date?
//        if d!.compare(startOfCurrentDate) == NSComparisonResult.OrderedDescending {
//            print("Yes")
//            return true
//        } else {
//            print("No")
//            return false
//        }
//        }
    
}

