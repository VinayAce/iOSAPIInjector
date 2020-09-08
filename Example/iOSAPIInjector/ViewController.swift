//
//  ViewController.swift
//  iOSAPIInjector
//
//  Created by VinayAce on 09/08/2020.
//  Copyright (c) 2020 VinayAce. All rights reserved.
//

import UIKit
import iOSAPIInjector

class ViewController: UIViewController {
    
    let network = AceAPIInjector.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

