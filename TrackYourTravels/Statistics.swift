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
    
    /// calculates the time between to dates. 
    func timeBetweenDates(date1: String, date2: String) -> Int {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        
        let d1 = dateFormatter.dateFromString(date1)
        let d2 = dateFormatter.dateFromString(date2)
        
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components([.Minute], fromDate: d1!, toDate: d2!, options: [])
        
        return components.minute
    }
    
    /// return the average traveled time and the time traveled per day (in 1 week)
    func returnWeekTimeArray () -> Array<Int> {
        
        let locations = DatabaseManager.sharedInstance.readAllFromDatabase()
        let days = 7
        var timeBetweenTravels : Array<Int> = []
        var dailyTimestampArray: Array<String>
        var timeTraveledPerWeek: Array<Int> = []

        // Loop over the different days.
        for index in 0...(days - 1) {
            
            var totalTime = 0
            dailyTimestampArray = []
            
            for location in locations {
                    if daysBetweenDates(location.timestamp) == index {
                        dailyTimestampArray.append(location.timestamp)
                    }
                }
            
                // Loooop over all the timestamps per day.
                for index in 0...(dailyTimestampArray.count - 2) {
                    
                    let date1 = dailyTimestampArray[index]
                    let date2 = dailyTimestampArray[index + 1]
                    let minute = timeBetweenDates(date1, date2: date2)
                    
                    // If there is more than 30 minutes between a timestamp is registered as 'not traveling'
                    if minute < 30 {
                        timeBetweenTravels.append(minute)
                        totalTime += timeBetweenDates(date1, date2: date2)
                    }
                }
            timeTraveledPerWeek.append(totalTime)
        }
        print(timeTraveledPerWeek)
        return (timeTraveledPerWeek)
    }
}




















