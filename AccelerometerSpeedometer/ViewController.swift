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

    
    func update() {
        print("1")
        if xLabel != nil {xLabel.text = String(format: "x: %.02f", self.speedo.getAccelerationValues().x)}
        if yLabel != nil {yLabel.text = String(format: "y: %.02f", self.speedo.getAccelerationValues().y)}
        if zLabel != nil {zLabel.text = String(format: "z: %.02f", self.speedo.getAccelerationValues().z)}
        
        let total = abs(speedo.getAccelerationValues().x + speedo.getAccelerationValues().y + speedo.getAccelerationValues().z)
        if totalLabel != nil {totalLabel.text = String(format: "total: %.02f", total)}
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("4")
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("3")
        speedo.setupMotionManager()
        
        self.displayLink = CADisplayLink(target: self, selector: #selector(self.update))
        if displayLink != nil {self.displayLink?.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)} else {print("nil")}
        print("2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

