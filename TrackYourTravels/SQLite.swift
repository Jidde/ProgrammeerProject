//
//  SQLite.swift
//  TrackYourTravels
//
//  Created by Jidde Koekoek on 01/06/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

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
    
    func writeToDatabase (time: String, lat: Double, long: Double, speed: Double) {
        
        let insert = locationInfo.insert(timestamp <- time, latitude <- lat, longitude <- long, velocity <- speed)
        do {
            let rowID = try database!.run(insert)
            print (rowID)
        } catch {
            print("Error creating to do: \(error)")
        }
    }
    
    func readAllFromDatabase () -> (LocationList) {
        
        let locations = LocationList?()
        
        
        if database != nil {
            do {
                for location in try database!.prepare(locationInfo)  {
                    locations.
                }
            } catch {
                print("Could not retrieve data from database: \(error)")
            }
        }
        
        return (locations!)
    }
    
    
    
    
}

class LocationList {
    
    private var locations = [LocationItem]()
    
    init(item: [LocationItem]) {
        self.locations = item
    }
    
    
    
}



class LocationItem {
    
    private var timestamp: String
    private var latitude: Double
    private var longitude: Double
    private var velocity: Double
 
    init (timestamp: String, latitude: Double, longitude: Double, velocity: Double) {
        self.latitude = latitude
        self.longitude = longitude
        self.timestamp = timestamp
        self.velocity = velocity
    }
}









    