//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Furkan Kaan Ugsuz on 28/07/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isM = true
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        img.isUserInteractionEnabled = true
        let gestureRec = UITapGestureRecognizer(target: self, action: #selector(changePic))
        img.addGestureRecognizer(gestureRec)
    }
    
    @objc func changePic(){
        
        if isM == true {
            img.image=UIImage(named: "minions")
            myLabel.text = "Hello! = Bello!"
            
            isM = false

        }else{
            
            img.image=UIImage(named: "minions2")
            myLabel.text = "For You = Para tu"
            isM = true
        }
        
    }


}

