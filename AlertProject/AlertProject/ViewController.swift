//
//  ViewController.swift
//  AlertProject
//
//  Created by Furkan Kaan Ugsuz on 28/07/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var password2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUp(_ sender: Any) {
/*
        let alert = UIAlertController(title: "Error!", message: "Username not found", preferredStyle:UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
*/
        if userName.text == "" {
            makeAlert(titleI: "Error", messageI: "Username not found")
        }
        else if password.text == "" {
        
             makeAlert(titleI: "Error", messageI: "Password not found")
        }
        else if password.text != password2.text {
            
             makeAlert(titleI: "Error", messageI: "Passwords dont match")
        }
        else{
            makeAlert(titleI: "Yeah!", messageI: "Wubba luba dub dub")
        }
        
        
        
    }
    func makeAlert(titleI: String, messageI: String){
        let alert = UIAlertController(title: titleI, message: messageI, preferredStyle:UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert,animated: true,completion: nil)
    }
    
}

