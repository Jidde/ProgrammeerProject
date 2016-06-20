//
//  SecondViewController.swift
//  TrackYourTravels
//
//  Created by Jidde Koekoek on 30/05/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var periodSetter: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    
    // Graph labels
    @IBOutlet weak var timeTraveled: UILabel!
    @IBOutlet weak var average: UILabel!
    @IBOutlet weak var avarageNumber: UILabel!
    @IBOutlet weak var maximum: UILabel!
    @IBOutlet weak var minimum: UILabel!
    @IBOutlet weak var total: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGraphDisplay()
    }
        
    override func viewWillAppear(animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func weekOrMonth(sender: AnyObject) {
        switch periodSetter.selectedSegmentIndex {
        case 0:
            setupGraphDisplay()
        case 1:
            break
        default:
            break;
        }
    }
    
    /// Set up the Graph.
    func setupGraphDisplay() {
        // Indicate that the graph needs to be redrawn.
        graphView.setNeedsDisplay()
        
        maximum.text = "\(graphView.statistics.maxElement()!)"
        
        // Calculate average from graphPoints
        let averageText = graphView.statistics.reduce(0, combine: +)
            / graphView.statistics.count
        average.text = "Average:"
        avarageNumber.text = "\(averageText)"
        
        var totalTime = 0
        
        for index in 0...graphView.statistics.count-1 {
            totalTime += graphView.statistics[index]
        }
        total.text = "\(totalTime)"
        
        // Day of week labels are set up in storyboard with tags.
        // Get today's day number.
        let dateFormatter = NSDateFormatter()
        let calendar = NSCalendar.currentCalendar()
        let componentOptions:NSCalendarUnit = .Weekday
        let components = calendar.components(componentOptions,
                                             fromDate: NSDate())
        var weekday = components.weekday
        let days = ["S", "S", "M", "T", "W", "T", "F"]
        
        // Set up the day name labels with correct day.
        for i in  (0...days.count-1).reverse() {
            if let labelView = graphView.viewWithTag(i) as? UILabel {
                if weekday == 7 {
                    weekday = 0
                }
                weekday -= 1
                if weekday < 0 {
                    weekday = days.count - 1
                }
                labelView.text = days[weekday]
            }
        }
    }
}







