//
//  Graph.swift
//  TrackYourTravels
//
//  Created by Jidde Koekoek on 03/06/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//
//  Custom View; Graph View, based on the statistics collected by the device.

import UIKit

// MARK: Tutorial material from: https://www.raywenderlich.com/90693/modern-core-graphics-with-swift-part-2

@IBDesignable class GraphView: UIView {
    
    var statistics = Statistics.statistics

    // The properties for the gradient
    @IBInspectable var startColor: UIColor = UIColor.redColor()
    @IBInspectable var endColor: UIColor = UIColor.greenColor()
    
    override func drawRect(rect: CGRect) {
        
        let width = rect.width
        let height = rect.height
        
        // Set up background clipping area
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: UIRectCorner.AllCorners,
                                cornerRadii: CGSize(width: 8.0, height: 8.0))
        path.addClip()
        
        // Get the current context
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.CGColor, endColor.CGColor]
        
        // Set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // Set up the color stops
        let colorLocations:[CGFloat] = [0.0, 1.0]
        
        // Create the gradient
        let gradient = CGGradientCreateWithColors(colorSpace,
                                                  colors,
                                                  colorLocations)
        
        // Draw the gradient
        var startPoint = CGPoint.zero
        var endPoint = CGPoint(x:0, y:self.bounds.height)
        CGContextDrawLinearGradient(context,
                                    gradient,
                                    startPoint,
                                    endPoint,
                                    [])
        
        // Calculate the x point
        let margin:CGFloat = 20.0
        let columnXPoint = { (column:Int) -> CGFloat in
            //Calculate gap between points
            let spacer = (width - margin*2 - 4) /
                CGFloat((self.statistics.count - 1))
            var x:CGFloat = CGFloat(column) * spacer
            x += margin + 2
            return x
        }
        
        // Calculate the y point
        let topBorder:CGFloat = 60
        let bottomBorder:CGFloat = 50
        let graphHeight = height - topBorder - bottomBorder
        let maxValue = statistics.maxElement()
        let columnYPoint = { (statistics:Int) -> CGFloat in
            var y:CGFloat = CGFloat(statistics) /
                CGFloat(maxValue!) * graphHeight
            y = graphHeight + topBorder - y // Flip the graph
            return y
        }

        // Draw the line graph
        UIColor.whiteColor().setFill()
        UIColor.whiteColor().setStroke()
        
        // Set up the points line
        let graphPath = UIBezierPath()
        // Go to start of line
        graphPath.moveToPoint(CGPoint(x:columnXPoint(0),
            y:columnYPoint(self.statistics[0])))
        
        // Add points for each item in the statistics array
        // At the correct (x, y) for the point
        for i in 1..<self.statistics.count {
            let nextPoint = CGPoint(x:columnXPoint(i),
                                    y:columnYPoint(self.statistics[i]))
            graphPath.addLineToPoint(nextPoint)
        }
        
        // Create the clipping path for the graph gradient
        // Save the state of the context (commented out for now)
        CGContextSaveGState(context)
        
        // Make a copy of the path
        let clippingPath = graphPath.copy() as! UIBezierPath
        
        // Add lines to the copied path to complete the clip area
        clippingPath.addLineToPoint(CGPoint(
            x: columnXPoint(self.statistics.count - 1),
            y:height))
        clippingPath.addLineToPoint(CGPoint(
            x:columnXPoint(0),
            y:height))
        clippingPath.closePath()
        
        // Add the clipping path to the context
        clippingPath.addClip()
        
        let highestYPoint = columnYPoint(maxValue!)
        startPoint = CGPoint(x:margin, y: highestYPoint)
        endPoint = CGPoint(x:margin, y:self.bounds.height)
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, [])
        CGContextRestoreGState(context)
        
        // Draw the line on top of the clipped gradient
        graphPath.lineWidth = 2.0
        graphPath.stroke()
        
        // Draw the circles on top of graph stroke
        for i in 0..<self.statistics.count {
            var point = CGPoint(x:columnXPoint(i), y:columnYPoint(self.statistics[i]))
            point.x -= 5.0/2
            point.y -= 5.0/2
            
            let circle = UIBezierPath(ovalInRect:
                CGRect(origin: point,
                    size: CGSize(width: 5.0, height: 5.0)))
            circle.fill()
        }
        
        // Draw horizontal graph lines on the top of everything
        let linePath = UIBezierPath()
        
        // Top line
        linePath.moveToPoint(CGPoint(x:margin, y: topBorder))
        linePath.addLineToPoint(CGPoint(x: width - margin,
            y:topBorder))
        
        // Center line
        linePath.moveToPoint(CGPoint(x:margin,
            y: graphHeight/2 + topBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin,
            y:graphHeight/2 + topBorder))
        
        // Bottom line
        linePath.moveToPoint(CGPoint(x:margin,
            y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin,
            y:height - bottomBorder))
        let color = UIColor(white: 1.0, alpha: 0.3)
        color.setStroke()
        
        linePath.lineWidth = 1.0
        linePath.stroke()
    }
}



