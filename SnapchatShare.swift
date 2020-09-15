//
//  ViewController.swift
//  VideoPostDeneme
//
//  Created by Furkan Kaan Ugsuz on 14/09/2020.
//  Copyright © 2020 Furkan Kaan Ugsuz. All rights reserved.
//

import UIKit
import SCSDKCreativeKit
import SceneKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var videoURL: URL?
    private let snapURL = URL(string: "snapchat://app")
    
    @IBOutlet weak var sceneView: SCNView!
    

    @IBOutlet weak var imageView: UIImageView!
    let imagePickerController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.mediaTypes = ["public.image", "public.movie"]
        present(imagePickerController, animated: true, completion: nil)
        
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        videoURL = info[UIImagePickerController.InfoKey.init(rawValue: "UIImagePickerControllerReferenceURL")] as? URL
        imageView.image = info[.originalImage] as? UIImage
        
    
    }
    
    
    @IBAction func clicked(_ sender: Any) {

        storiesSnapchat(url: videoURL!)
       
    }
    
    func storiesSnapchat (url:URL) {
         let video = SCSDKSnapVideo(videoUrl: url)
                let snap = SCSDKVideoSnapContent(snapVideo: video)
                snap.caption = "Snap on Snapchat!"

                snap.attachmentUrl = "https://www.snapchat.com"

                let api = SCSDKSnapAPI(content: snap)
                
                api.startSnapping { error in
                    
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
        //            success
                    }
                }
    }
    
}