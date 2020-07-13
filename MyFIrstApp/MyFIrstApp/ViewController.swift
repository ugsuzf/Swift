//
//  ViewController.swift
//  MyFIrstApp
//
//  Created by Furkan Kaan Ugsuz on 13/07/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: Any) {
        imageView.image = UIImage(named: "minions2")
    }
    
}

