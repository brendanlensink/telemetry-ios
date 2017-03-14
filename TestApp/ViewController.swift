//
//  ViewController.swift
//  TestApp
//
//  Created by Justin D'Arcangelo on 3/13/17.
//
//

import UIKit
import Telemetry

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let telemetry = Telemetry(storageName: "telemetry")
        telemetry.recordSessionStart()
        telemetry.recordSessionEnd()
        telemetry.queueCorePing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

