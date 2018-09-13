//
//  ViewController.swift
//  IOS-Swift-CoreMotionAccelerometer01
//
//  Created by Pooya on 2018-09-12.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var XAccel: UITextField!
    @IBOutlet weak var yAccel: UITextField!
    @IBOutlet weak var zAccel: UITextField!
    
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myAccelerometer()
    }

    func myAccelerometer() {
        print("Start Accelerometer")
        motion.accelerometerUpdateInterval = 0.5
        motion.startAccelerometerUpdates(to: OperationQueue.current!) {
            (data, error) in
            print(data as Any)
            if let trueData =  data {
                
                self.view.reloadInputViews()
                let x = trueData.acceleration.x
                let y = trueData.acceleration.y
                let z = trueData.acceleration.z
                self.XAccel!.text = "x: \(Double(x).rounded(toPlaces :3))"
                self.yAccel!.text = "y: \(Double(y).rounded(toPlaces :3))"
                self.zAccel!.text = "z: \(Double(z).rounded(toPlaces :3))"
            }
        }
        
        return
    }


}



extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
