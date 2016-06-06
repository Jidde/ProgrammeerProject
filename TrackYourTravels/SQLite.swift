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
        
        
        
    }
    
    
    
    func readAllFromDatabase ()  {
        
        
        
        
    }
    
    
    
    
}

//class LocationList: LocationItem {
//    
//    
//}
//
//class LocationItem {
//    
//    private var timestamp: String
//    private var latitude: Double
//    private var longitude: Double
//    private var velocity: Double
// 
//    init (timestamp: String, latitude: Double, longitude: Double, velocity: Double) {
//        self.latitude = latitude
//        self.longitude = longitude
//        self.timestamp = timestamp
//        self.velocity = velocity
//    }
//}
//








    