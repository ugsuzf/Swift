//
//  ViewController.swift
//  BirthDayNoteTaker
//
//  Created by Furkan Kaan Ugsuz on 27/07/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var dobText: UITextField!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dobLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let storedName = UserDefaults.standard.object(forKey:"name")
        let storedDob = UserDefaults.standard.object(forKey: "dob")
        if let newName = storedName as? String{
            nameLabel.text = "Name: \(newName)"
        }
        if let newDob = storedDob as? String {
            dobLabel.text = "Surname: \(newDob)"
        }
   
        // Do any additional setup after loading the view.
    }

    @IBAction func saveClicked(_ sender: Any) {
        UserDefaults.standard.set(nameText.text, forKey:"name")
        UserDefaults.standard.set(dobText.text, forKey: "dob")
        
        nameLabel.text = "Name: \(nameText.text!)"
        dobLabel.text = "Surname: \(dobText.text!)"
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedDob = UserDefaults.standard.object(forKey: "dob")
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
        }
        if (storedDob as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "dob")
        }
    }
    
}

