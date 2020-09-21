//
//  Icons.swift
//  UICollectionView
//
//  Created by Furkan Kaan Ugsuz on 19/09/2020.
//

import Foundation
import UIKit

class Icons {
    var title = ""
    var featureImage: UIImage
    
    init(title: String, featuredImage: UIImage) {
        self.title = title
        self.featureImage = featuredImage
    }
    
    static func fetchIcons() -> [Icons]{
        return [Icons(title: "Feed", featuredImage: UIImage(named: "insta")!), Icons(title: "Stories", featuredImage: UIImage(named: "insta")!),Icons(title: "Stories", featuredImage: UIImage(named: "snap")!),Icons(title: "Stories", featuredImage: UIImage(named: "face")!), Icons(title: "Share", featuredImage: UIImage(named: "share")!)]
    }
}
