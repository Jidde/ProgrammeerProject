//
//  Statistics.swift
//  TrackYourTravels
//
//  Created by Jidde Koekoek on 06/06/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import Foundation

class Statistics {
    
    // Set current date to end of day.
    let newDate: NSDate = NSCalendar.currentCalendar().dateBySettingHour(23, minute: 59, second: 59, ofDate: NSDate(), options: NSCalendarOptions())!
    
    private static let days = 7
    static let statistics = Statistics().returnWeekTimeArray(days)
    
    /// http://stackoverflow.com/questions/24723431/swift-days-between-two-nsdates
    func daysBetweenDates(startDate: String) -> Int {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        let d = dateFormatter.dateFromString(startDate)
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day], fromDate: d!, toDate: newDate, options: [])
                
        return components.day
    }
    
    /// Calculates the time between to dates.
    func timeBetweenDates(date1: String, date2: String) -> Int {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        let d1 = dateFormatter.dateFromString(date1)
        let d2 = dateFormatter.dateFromString(date2)
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Minute], fromDate: d1!, toDate: d2!, options: [])
        
        return components.minute
    }
    
    /// Return the average traveled time and the time traveled per day (in 1 week)
    func returnWeekTimeArray (d: Int) -> Array<Int> {
        
        // TODO: READ LAST 7/31 FROM DATABASE
        let locations = DatabaseManager.sharedInstance.readAllFromDatabase()
        let days = d
        var dailyTimestampArray: Array<String>
        var timeTraveledPerWeek: Array<Int> = []

        //Loop over the different days.
        for index in 0...(days - 1) {
            
            var totalTime = 0
            dailyTimestampArray = []
            
            for location in locations {
                    if daysBetweenDates(location.timestamp) == index {
                        dailyTimestampArray.append(location.timestamp)                        
                    }
                }
            
            if dailyTimestampArray.count > 2 {
                // Loooop over all the timestamps per day.
                for index in 0...(dailyTimestampArray.count - 2) {
                    
                    let date1 = dailyTimestampArray[index]
                    let date2 = dailyTimestampArray[index + 1]
                    let minute = timeBetweenDates(date1, date2: date2)
                    
                    // If there is more than 30 minutes between a timestamp is registered as 'not traveling'
                    if minute < 30 {
                        totalTime += timeBetweenDates(date1, date2: date2)
                    }
                }
            timeTraveledPerWeek.insert(totalTime, atIndex: 0)
            }
        }
        print(timeTraveledPerWeek)
        
        // Check if there are enough statistics (values in the array) and insert 1 as placeholder if not.
        if timeTraveledPerWeek.count < days {
            for index in 0...(days - timeTraveledPerWeek.count) {
                timeTraveledPerWeek.insert(1, atIndex: 0)
            }
        }
        return (timeTraveledPerWeek)
    }
}




















