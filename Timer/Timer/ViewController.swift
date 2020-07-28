//
//  ViewController.swift
//  Timer
//
//  Created by Furkan Kaan Ugsuz on 28/07/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0
    var timer = Timer()

    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 10
        timeLabel.text = "Time :  \(counter)"
        
    }

    @IBAction func buttonClicked(_ sender: Any) {
        if counter >= 0 {
             timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        }
       
    }
    @objc func timerFunc(){
        timeLabel.text = "Time :  \(counter)"
        counter -= 1
        
        if counter == 0 {
            timer.invalidate()
            timeLabel.text="Time Over"
        }
    }
    
}

