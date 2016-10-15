//
//  AccelerometerSpeedometer.swift
//  AccelerometerSpeedometer
//
//  Created by ACE on 10/15/16.
//  Copyright © 2016 Adrian Edwards. All rights reserved.
//

import CoreMotion

class AccelerometerSpeedometer {
    
    var motionManager = CMMotionManager()
    
    
    
    func getMotionManager() -> CMMotionManager { return motionManager }
    
    func setupMotionManager() {
        
        if (motionManager.isAccelerometerAvailable) {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates()
        } else {
            print("Accelerometer not availible on this device")
        }
    }
    
    func getAccelerationValues() -> (x:Double, y:Double, z:Double) {
        let accel = motionManager.accelerometerData?.acceleration
        return (x: accel!.x, y: accel!.y, z: accel!.z)
    }
    
}
