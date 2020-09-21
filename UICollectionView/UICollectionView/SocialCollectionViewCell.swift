//
//  SocialCollectionViewCell.swift
//  UICollectionView
//
//  Created by Furkan Kaan Ugsuz on 19/09/2020.
//

import UIKit

class SocialCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var icon: Icons! {
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let icon = icon{
            imageView.image = icon.featureImage
            nameLabel.text = icon.title
        }
        else{
            imageView.image = nil
            nameLabel.text = nil
        }
    }
    
} 
