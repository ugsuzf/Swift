//
//  ViewController.swift
//  moody.ugsuzf.FacebookSharing
//
//  Created by Furkan Kaan Ugsuz on 10/09/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit
import FBSDKShareKit
import FacebookShare
import FBSDKLoginKit
import Photos
import Social

class FacebookShare: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, SharingDelegate {
    var videoURL: URL?
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.mediaTypes = ["public.image", "public.movie"]
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func sharer(_ sharer: Sharing, didCompleteWithResults results: [String: Any]) {
      let title = "Share Success"
      let message = "Succesfully shared: \(results)"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
      self.present(alertController, animated: true, completion: nil)
    }

    func sharer(_ sharer: Sharing, didFailWithError error: Error) {
      let title = "Share Failed"
      let message = "Sharing failed with error \(error)"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
      self.present(alertController, animated: true, completion: nil)
    }

    func sharerDidCancel(_ sharer: Sharing) {
      let title = "Share Cancelled"
      let message = "Sharing was cancelled by user."
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
      self.present(alertController, animated: true, completion: nil)
    }
    func showShareDialog<C: SharingContent>(_ content: C, mode: ShareDialog.Mode = .automatic) {
      let dialog = ShareDialog(fromViewController: self, content: content, delegate: self)
      dialog.mode = mode
      dialog.show()
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        videoURL = info[UIImagePickerController.InfoKey.init(rawValue: "UIImagePickerControllerReferenceURL")] as? URL
        shareFacebook(url: videoURL)
           
        
    }
    
    func shareFacebook(url : URL){
        let vidName = videoURL.lastPathComponent
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let localPath = documentDirectory?.appending(vidName)
        let video = URL.init(fileURLWithPath: localPath!)//NSURL(fileURLWithPath: localPath!)
        print(videoURL)
        let content =  ShareVideoContent()
        content.video = ShareVideo(videoURL: video)
                   
        showShareDialog(content)
    }
    
}

