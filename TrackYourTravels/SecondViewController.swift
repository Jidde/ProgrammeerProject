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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        setupGraphDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGraphDisplay() {
        
        //2 - indicate that the graph needs to be redrawn
        graphView.setNeedsDisplay()
        
        maximum.text = "\(graphView.statistics.maxElement()!)"
        
        //3 - calculate average from graphPoints
        let averageText = graphView.statistics.reduce(0, combine: +)
            / graphView.statistics.count
        average.text = "Average:"
        avarageNumber.text = "\(averageText)"
        
        //set up labels
        //day of week labels are set up in storyboard with tags
        //today is last day of the array need to go backwards
        
        //4 - get today's day number
        let dateFormatter = NSDateFormatter()
        let calendar = NSCalendar.currentCalendar()
        let componentOptions:NSCalendarUnit = .Weekday
        let components = calendar.components(componentOptions,
                                             fromDate: NSDate())
        var weekday = components.weekday
        
        let days = ["S", "S", "M", "T", "W", "T", "F"]
        
        //5 - set up the day name labels with correct day
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







