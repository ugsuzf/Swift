//
//  ViewController.swift
//  Minions
//
//  Created by Furkan Kaan Ugsuz on 29/07/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var minionsName = [String]()
    var minionsImg = [UIImage]()
    var chosenImg = UIImage()
    var chosenName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate =  self
        tableView.dataSource = self
        
        
        minionsName.append("Bob")
        minionsName.append("Kevin")
        minionsName.append("Stuart")
        minionsName.append("Phil")
        minionsName.append("Tim")
        minionsName.append("Carl")
        minionsName.append("Jorge")
        
        
        minionsImg.append(UIImage(named: "bob-minion")!)
        minionsImg.append(UIImage(named: "kevin-minion")!)
        minionsImg.append(UIImage(named: "stuart-minion")!)
        minionsImg.append(UIImage(named: "phil-minion")!)
        minionsImg.append(UIImage(named: "tim-minion")!)
        minionsImg.append(UIImage(named: "carl-minion")!)
        minionsImg.append(UIImage(named: "jorge-minion")!)
        
        navigationItem.title = "Minions"
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            minionsName.remove(at: indexPath.row)
            minionsImg.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return minionsName.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = minionsName[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenName = minionsName[indexPath.row]
        chosenImg = minionsImg[indexPath.row]
        performSegue(withIdentifier: "toImage", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImage" {
            let  destVC = segue.destination as! imageViewController
            destVC.selectedMinionName = chosenName
            destVC.seletedMinionImage = chosenImg
        }
    }


}

