//
//  ViewController.swift
//  CatchtheMinion
//
//  Created by Furkan Kaan Ugsuz on 28/07/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var bob1: UIImageView!
    @IBOutlet weak var bob2: UIImageView!
    @IBOutlet weak var bob3: UIImageView!
    @IBOutlet weak var bob4: UIImageView!
    @IBOutlet weak var bob5: UIImageView!
    @IBOutlet weak var bob6: UIImageView!
    @IBOutlet weak var bob7: UIImageView!
    @IBOutlet weak var bob8: UIImageView!
    @IBOutlet weak var bob9: UIImageView!
    
    var score = 0
    var timer = Timer()
    var hidenTimer = Timer()
    var counter = 0
    var bobArray = [UIImageView]()
    var highScore = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let storedHighscore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighscore == nil {
            highScore = 0
            highscoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighscore as? Int {
            highScore = newScore
            highscoreLabel.text = "Highscore: \(highScore)"
        }
        
        scoreLabel.text = "Score : \(score) "
        bob1.isUserInteractionEnabled = true
        bob2.isUserInteractionEnabled = true
        bob3.isUserInteractionEnabled = true
        bob4.isUserInteractionEnabled = true
        bob5.isUserInteractionEnabled = true
        bob6.isUserInteractionEnabled = true
        bob7.isUserInteractionEnabled = true
        bob8.isUserInteractionEnabled = true
        bob9.isUserInteractionEnabled = true
        
        let rec1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let rec9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        bob1.addGestureRecognizer(rec1)
        bob2.addGestureRecognizer(rec2)
        bob3.addGestureRecognizer(rec3)
        bob4.addGestureRecognizer(rec4)
        bob5.addGestureRecognizer(rec5)
        bob6.addGestureRecognizer(rec6)
        bob7.addGestureRecognizer(rec7)
        bob8.addGestureRecognizer(rec8)
        bob9.addGestureRecognizer(rec9)
        
        bobArray = [bob1,bob2,bob3,bob4,bob5,bob6,bob7,bob8,bob9]
        
        
        counter = 15
        timeLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hidenTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(hideBob), userInfo: nil, repeats: true)
        
        
        
    }
    
    @objc func hideBob(){
        
        for bob in bobArray {
            bob.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(bobArray.count-1)))
        bobArray[random].isHidden=false
        
        
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score : \(score)"
        
    }
    @objc func countDown(){
        counter -= 1
        timeLabel.text = String(counter)
        
        
        if counter == 0{
            timer.invalidate()
            hidenTimer.invalidate()
            
            if self.score > self.highScore {
                self.highScore = self.score
                highscoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
            
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again ?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                //replay func
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 15
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hidenTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.hideBob), userInfo: nil, repeats: true)
                
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true ,completion: nil)
        }
    }


}

