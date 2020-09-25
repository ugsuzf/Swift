//
//  ViewController.swift
//  SliderWithWebService
//
//  Created by Furkan Kaan Ugsuz on 22/09/2020.
//

import UIKit
struct Hero: Decodable {
    let localized_name : String
    let img : String
    
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    let viewLayout = UICollectionViewFlowLayout()
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        cell.imageView.layer.cornerRadius = cell.imageView.frame.height / 2

       
        cell.imageView.contentMode = .scaleAspectFill
        let defaultLink = "https://api.opendota.com"
        let completeLink = defaultLink + heroes[indexPath.row].img
        let url = URL(string: completeLink)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        cell.imageView.image = UIImage(data: data!)
        cell.imageView.clipsToBounds = true
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

//        let tempHight = collectionView.frame.height
//        let tempwidth = collectionView.frame.width / 5
//
//
//        layout.itemSize = CGSize(width: tempwidth , height: tempwidth )
//
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        collectionView.collectionViewLayout = layout
                return cell
        
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var heroes = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        let width = UIScreen.main.bounds.width

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.estimatedItemSize = CGSize(width: width, height: width / 5)
        layout.itemSize = CGSize(width: width/5 , height: width/5 )
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
//        let newView = UICollectionView()
//        let height = collectionView.collectionViewLayout.collectionViewContentSize.height
//
//        let widthConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view.self, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: view.frame.width )
//        let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view.self, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: view.frame.width / 5 )
//            collectionView.addConstraints([widthConstraint, heightConstraint])
//
//
//
        
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do{
                    self.heroes = try JSONDecoder().decode([Hero].self, from: data!)
                    
                }catch{
                    print("asd")
                }
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()            }
        }.resume()
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//        return CGSize(width: collectionView.frame.width / 5 , height: collectionView.frame.width / 5 )
//    }
    


}





