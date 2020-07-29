//
//  imageViewController.swift
//  Minions
//
//  Created by Furkan Kaan Ugsuz on 29/07/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedMinionName = ""
    var seletedMinionImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedMinionName
        imageView.image = seletedMinionImage

       
    }
    


}
