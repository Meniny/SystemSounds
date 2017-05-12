//
//  ViewController.swift
//  SystemSounds-Example
//
//  Created by Meniny on 2017-05-13.
//  Copyright © 2017年 Meniny. All rights reserved.
//

import UIKit
import SystemSounds

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var idx: Int = 0
    var ids: [SystemSounds.IDs] = [
        .SMSReceivedSelectionSMSReceived1,
        .SMSReceivedSelectionSMSReceived2,
        .SMSReceivedSelectionSMSReceived3,
        .SMSReceivedSelectionSMSReceived4,
        .SMSReceivedSelectionSMSReceivedVibrate,
        .SMSReceivedSelectionSMSReceived01,
        .SMSReceivedSelectionSMSReceived5,
        .SMSReceivedSelectionSMSReceived6,
    ]
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.idx >= self.ids.count {
            self.idx = 0
        }
        SystemSounds.play(soundID: self.ids[self.idx].rawValue)
        self.idx += 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

