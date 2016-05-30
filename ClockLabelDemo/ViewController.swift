//
//  ViewController.swift
//  ClockLabelDemo
//
//  Created by Carlos Alcala on 5/26/16.
//  Copyright © 2016 Carlos Alcala. All rights reserved.
//

import UIKit
import ClockLabel

class ViewController: UIViewController {

    let clock1 = ClockLabel()
    let clock2 = ClockLabel()
    let clock3 = ClockLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clock1.customize { label in
            label.backgroundColor = UIColor.blackColor()
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor(red: 0.2, green: 0.7, blue: 1.0, alpha: 1.0)
            label.fontHandler = ClockFontHandler(name: .Digital7, size: 150)
            label.glowColor = label.textColor
            label.glowOffset = CGSize(width: 2.0, height: 2.0)
            label.glowAmount = 15.0
            label.text = "8:00"
        }
        
        self.clock2.customize { label in
            label.backgroundColor = UIColor.blackColor()
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor.whiteColor()
            label.fontHandler = ClockFontHandler(name: .DigitalDismay, size: 150)
            label.glowColor = label.textColor
            label.glowOffset = CGSize(width: 3.0, height: 0.0)
            label.glowAmount = 20.0
            label.text = "9:00"
        }
        
        self.clock3.customize { label in
            label.backgroundColor = UIColor.blackColor()
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor.greenColor()
            label.fontHandler = ClockFontHandler(name: .AdvancedPixelLCD7, size: 50)
            label.glowColor = label.textColor
            label.glowOffset = CGSize(width: 2.0, height: 2.0)
            label.glowAmount = 20.0
            label.text = "10:00"
        }
        
        
        self.clock1.frame = CGRect(x: 50, y: 40, width: view.frame.width - 100, height: 200)
        self.view.addSubview(clock1)
        
        self.clock2.frame = CGRect(x: 50, y: 260, width: view.frame.width - 100, height: 200)
        self.view.addSubview(clock2)
        
        self.clock3.frame = CGRect(x: 50, y: 480, width: view.frame.width - 100, height: 200)
        self.view.addSubview(clock3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

