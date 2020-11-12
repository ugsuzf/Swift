//
//  ViewController.swift
//  Lottie Animations
//
//  Created by Furkan Kaan Ugsuz on 11/11/2020.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    var animationView: AnimationView?
    override func viewDidLoad() { 
        // Do any additional setup after loading the view.
        animationView = .init(name: "rocket")
        animationView?.frame = view.bounds
        animationView?.loopMode = .loop
        view.addSubview(animationView!)
        animationView?.play()
        
        
    }


}

