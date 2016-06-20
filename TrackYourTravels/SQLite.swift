//
//  SQLite.swift
//  TrackYourTravels
//
//  Created by Jidde Koekoek on 01/06/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//
//  Database management

import Foundation
import SQLite

class DatabaseManager {
    
    static let sharedInstance = DatabaseManager()
    
    // MARK: SQLite database
    private var database: Connection?
    
    private let locationInfo = Table("LocationInfo")
    private let id = Expression<Int64>("ID")
    private let timestamp = Expression<String?>("Timestamp")
    private let latitude = Expression<Double?>("Latitude")
    private let longitude = Expression<Double?>("Longitude")
    private let velocity = Expression<Double?>("Velocity")
    
    func connectToDatabase () {
        
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        
        do {
            database = try Connection("\(path)/db.sqlite3")
        } catch {
            print ("Cannot connect to database: \(error)")
        }
    }
    
    func createTable () {
        
        do {
            try database!.run(locationInfo.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .Autoincrement)
                t.column(timestamp)
                t.column(latitude)
                t.column(longitude)
                t.column(velocity)
                } )
        } catch {
            print ("Cannot create table: \(error)")
        }
    }
    
    func writeToDatabase (time: NSDate, lat: Double, long: Double, speed: Double) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        let timestampString = dateFormatter.stringFromDate(time)
        
        let insert = locationInfo.insert(timestamp <- timestampString, latitude <- lat, longitude <- long, velocity <- speed)
        do {
            let rowID = try database!.run(insert)
            print (rowID)
        } catch {
            print("Error creating to do: \(error)")
        }
    }
    
    func readAllFromDatabase () -> (Array<LocationItem>) {
        
        var locations = Array<LocationItem>()
    
        if database != nil {
            do {
                for location in try database!.prepare(locationInfo)  {
                    let time = location.get(timestamp)
                    let lat = location.get(latitude)
                    let long = location.get(longitude)
                    let velo = location.get(velocity)
                    let loc = LocationItem.init(timestamp: time!, latitude: lat!, longitude: long!, velocity: velo!)
                    locations.append(loc)
                }
            } catch {
                print("Could not retrieve data from database: \(error)")
            }
        }
        return (locations)
    }
}











    