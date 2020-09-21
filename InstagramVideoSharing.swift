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
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            let fetchResult = PHAsset.fetchAssets(with: .video, options: fetchOptions)
            if let lastAsset = fetchResult.firstObject {
                let localIdentifier = lastAsset.localIdentifier
                let u = "instagram://library?LocalIdentifier=" + localIdentifier
                print(localIdentifier)
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
    func shareToInstagramStories(video: URL) {
            // NOTE: you need a different custom URL scheme for Stories, instagram-stories, add it to your Info.plist!
        if let storiesUrl = URL(string: "instagram-stories://share") {
            if UIApplication.shared.canOpenURL(storiesUrl) {
                guard let videoData = NSData(contentsOf: video) else { return print("fuck") }
                let pasteboardItems: [String: Any] = [
                    "com.instagram.sharedSticker.backgroundVideo": videoData,
                    "com.instagram.sharedSticker.backgroundTopColor": "#636e72",
                    "com.instagram.sharedSticker.backgroundBottomColor": "#b2bec3"
                ]
                let pasteboardOptions = [
                    UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(300)
                ]
                UIPasteboard.general.setItems([pasteboardItems], options: pasteboardOptions)
                UIApplication.shared.open(storiesUrl, options: [:], completionHandler: nil)
            }else {
                print("User doesn't have instagram on their device.")
            }
        }
    }}

