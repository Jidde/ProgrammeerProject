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
    
    let week = 7
    let month = 30

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGraphDisplay(week)
    }
    
    override func viewWillAppear(animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func weekOrMonth(sender: AnyObject) {
        switch periodSetter.selectedSegmentIndex {
        case 0:
            graphView.statistics = Statistics().returnWeekTimeArray(week)
            self.setupGraphDisplay(week)

        case 1:
            graphView.statistics = Statistics().returnWeekTimeArray(month)
            self.setupGraphDisplay(month)

        default:
            break;
        }
    }
    
    // https://www.raywenderlich.com/90693/modern-core-graphics-with-swift-part-2
    /// Set up the Graph. Redraw view and add some labels.
    func setupGraphDisplay(noOfDays: Int) {
        
        let numberOfDays = noOfDays
        
        // Indicate that the graph needs to be redrawn.
        graphView.setNeedsDisplay()
        
        maximum.text = "\(graphView.statistics.maxElement()!)"
        
        // Calculate average from graphPoints
        let averageText = graphView.statistics.reduce(0, combine: +)
            / graphView.statistics.count
        average.text = "Average:"
        avarageNumber.text = "\(averageText) minutes"
        
        var totalTime = 0
        
        for index in 0...graphView.statistics.count-1 {
            totalTime += graphView.statistics[index]
        }
        total.text = "\(totalTime/60) hours"
        
        // Day of week labels are set up in storyboard with tags.
        // Get today's day number.
        let dateFormatter = NSDateFormatter()
        let calendar = NSCalendar.currentCalendar()
        let componentOptions:NSCalendarUnit = .Weekday
        let components = calendar.components(componentOptions,
                                             fromDate: NSDate())
        var weekday = components.weekday
        
        let days = ["S", "S", "M", "T", "W", "T", "F"]
        weekday += 1
        
        // Set up the day name labels with correct day.
        for i in (1...numberOfDays).reverse() {
            if let labelView = graphView.viewWithTag(i) as? UILabel {
                
                if numberOfDays == week {
                    if weekday == numberOfDays {
                        weekday = 0
                    }
                    weekday -= 1
                    if weekday < 0 {
                        weekday = numberOfDays - 1
                    }
                    labelView.text = days[weekday]
                }
                else {
                    if let labelView = graphView.viewWithTag(1) as? UILabel {
                        labelView.text = "\(month)"
                    }
                    for index in (2...6) {
                        if let labelView = graphView.viewWithTag(index) as? UILabel {
                            labelView.text = ""
                        }
                    }
                    if let labelView = graphView.viewWithTag(7) as? UILabel {
                        labelView.text = "Now"
                    }
                }
            }
        }
    }
}







