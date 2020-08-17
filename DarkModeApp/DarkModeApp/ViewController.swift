//
//  ViewController.swift
//  DarkModeApp
//
//  Created by Furkan Kaan Ugsuz on 17/08/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        overrideUserInterfaceStyle = .light
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let userI = traitCollection.userInterfaceStyle
        
        if userI == .dark {
            changeButton.tintColor = UIColor.white
        }else{
            changeButton.tintColor = UIColor.blue
        }
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userI = traitCollection.userInterfaceStyle
        if userI == .dark {
            changeButton.tintColor = UIColor.white
        }else{
            changeButton.tintColor = UIColor.blue
        }
    }

}

