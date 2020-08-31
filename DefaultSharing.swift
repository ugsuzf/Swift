//
//  ViewController.swift
//  ugsuz.Moody.defaultShare
//
//  Created by Furkan Kaan Ugsuz on 26/08/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var url = URL(string: "")

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func shareTap(_ sender: Any) {
        let image = imageView.image?.jpegData(compressionQuality: 0.8)
        defaultShare(any: image as Any)
        
    }
    func defaultShare(any : Any){
        let activityCont = UIActivityViewController(activityItems: [any], applicationActivities: nil)
        
        present(activityCont, animated: true, completion: nil)
    }
    
}
