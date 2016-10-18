//
//  ViewController.swift
//  AccelerometerSpeedometer
//
//  Created by ACE on 10/15/16.
//  Copyright © 2016 Adrian Edwards. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let speedo = AccelerometerSpeedometer()
    var displayLink:CADisplayLink?
    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    var speed:Double = 0;

    
    func update() {
        if let xLabelu = xLabel {xLabelu.text = String(format: "x: %.02f", self.speedo.getAccelerationValues().x)} else {print("nil2")}
        if let yLabelu = yLabel {yLabelu.text = String(format: "y: %.02f", self.speedo.getAccelerationValues().y)} else {print("nil3")}
        if let zLabelu = zLabel {zLabelu.text = String(format: "z: %.02f", self.speedo.getAccelerationValues().z)} else {print("nil4")}
        
        let total = abs(speedo.getAccelerationValues().x + speedo.getAccelerationValues().y + speedo.getAccelerationValues().z)
        totalLabel.text = String(format: "total: %.02f", total)
        
        speed = speed+total-1
        sumLabel.text = String(format: "total: %.02f", speed)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("4")
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

        
        displayLink = CADisplayLink(target: self, selector: #selector(self.update))
        if let displayLinku = displayLink {displayLinku.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)} else {print("nil1")}
        print("2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

