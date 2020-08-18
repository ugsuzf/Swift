//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Furkan Kaan Ugsuz on 18/08/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRates(_ sender: Any) {
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=0796e615c728358451a1180c60ec0c42")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert,animated: true , completion: nil)
                
                
            } else  {
                if data != nil{
                    do{
                    let jsonresponse = try  JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            if let rates = jsonresponse["rates"] as? [String : Any]{
                                if let cad = rates["CAD"] as? Double{
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double{
                                    self.chfLabel.text = "CHF: \(chf)"
                                }

                                if let gbp = rates["GBP"] as? Double{
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }

                                if let cad = rates["JPY"] as? Double{
                                    self.jpyLabel.text = "JPY: \(cad)"
                                }

                                if let cad = rates["TRY"] as? Double{
                                    self.tryLabel.text = "TRY: \(cad)"
                                }


                            }
                        }
                    }catch{
                        print("Error")
                    }
                }
            }
        }
        task.resume()
        
    }
    
}

