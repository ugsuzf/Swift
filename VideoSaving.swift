import UIKit

class ViewController: UIViewController {    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        videoSave(url: URL(string: "/Users/padawan/Downloads/ForBiggerBlazes.mp4")!)

    }
    
    @objc func video(_ videoPath: String, didFinishSavingWithError error: Error?, contextInfo info: AnyObject) {
        let title = (error == nil) ? "Success" : "Error"
        let message = (error == nil) ? "Video was saved" : "Video failed to save"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func videoSave(url : URL){
        UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url.path)
        // Handle a movie capture
        UISaveVideoAtPathToSavedPhotosAlbum(
            url.path,
            self,
            #selector(video(_:didFinishSavingWithError:contextInfo:)),
            nil)
    }
}