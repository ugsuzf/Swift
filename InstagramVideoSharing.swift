//
//  ViewController.swift
//  InstaDeneme
//
//  Created by Furkan Kaan Ugsuz on 07/09/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {


    func instaFeed(){
//        sharing last saved video :
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let fetchResult = PHAsset.fetchAssets(with: .video, options: fetchOptions)
        if let lastAsset = fetchResult.firstObject {
            let localIdentifier = lastAsset.localIdentifier
            let u = "instagram://library?LocalIdentifier=" + localIdentifier
            let url = NSURL(string: u)!
            if UIApplication.shared.canOpenURL(url as URL) {
                UIApplication.shared.open(URL(string: u)!, options: [:], completionHandler: nil)
            } else {

                let urlStr = "https://itunes.apple.com/in/app/instagram/id389801252?mt=8"
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(URL(string: urlStr)!, options: [:], completionHandler: nil)

                } else {
                    UIApplication.shared.openURL(URL(string: urlStr)!)
                }
            }

        }
    }
    func shareToInstagramStories(video: NSData) {
        // NOTE: you need a different custom URL scheme for Stories, instagram-stories, add it to your Info.plist!
        guard let instagramUrl = URL(string: "instagram-stories://share") else {
            return
        }

        if UIApplication.shared.canOpenURL(instagramUrl) {
            let pasterboardItems = [["com.instagram.sharedSticker.backgroundVideo": video as Any]]
            UIPasteboard.general.setItems(pasterboardItems)
            UIApplication.shared.open(instagramUrl)
        } else {
            print("yeayyy")
        }
    }


}

