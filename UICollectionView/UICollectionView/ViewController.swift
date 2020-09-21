//
//  ViewController.swift
//  UICollectionView
//
//  Created by Furkan Kaan Ugsuz on 19/09/2020.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
    

    @IBOutlet weak var iconsView: UICollectionView!
    var icons = Icons.fetchIcons()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        iconsView.delegate = self
        iconsView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = iconsView.dequeueReusableCell(withReuseIdentifier: "SocialCollectionViewCell", for: indexPath) as! SocialCollectionViewCell
        let icon = icons[indexPath.item]
        
        cell.icon = icon
        
        return cell
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  1
        
    }


}

