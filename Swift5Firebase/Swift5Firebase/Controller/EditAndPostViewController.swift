//
//  EditAndPostViewController.swift
//  Swift5Firebase
//
//  Created by 尾原徳泰 on 2020/04/06.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

class EditAndPostViewController: UIViewController {
    
    var passedImage = UIImage()
    var userName = String()
    var userImageString = String()
    var userImageData = Data()
    var userImgae = UIImage()
    
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var commentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "userName") != nil {
            userName = UserDefaults.standard.object(forKey: "userName") as! String
        }
        
        if UserDefaults.standard.object(forKey: "userImage") != nil {
            userImageData = UserDefaults.standard.object(forKey: "userImage") as! Data
            
            userImgae = UIImage(data: userImageData)!
        }
        
        userProfileImageView.image = userImgae
        
        userNameLabel.text = userName
        
        contentImageView.image = passedImage
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func postAction(_ sender: Any) {
        
        let timeLineDB = Database.database().reference().child("timeLine").childByAutoId()
        
        let storage = Storage.storage().reference(forURL: "")
        
        let key = timeLineDB.child("Users").childByAutoId().key
        let key2 = timeLineDB.child("Contents").childByAutoId().key
        
        
        let imageRef = storage.child("Users").child("\(String(describing: key!)).jpg")
        let imageRef2 = storage.child("Contents").child("\(String(describing: key2!)).jpg")
        
        var userProfileimageData:Data = Data()
        var contentImageData:Data = Data()
        
        if userProfileImageView.image != nil {
            userProfileimageData = (userProfileImageView.image?.jpegData(compressionQuality: 0.01))!
        
        }
        
        if contentImageView.image != nil {
            contentImageData = (contentImageView.image?.jpegData(compressionQuality: 0.01))!
        
        }
        
        let uploadTask = imageRef.putData(userProfileimageData, metadata: nil) {
            (metaData,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            let uploadTask2 = imageRef2.putData(contentImageData, metadata: nil) {
                (metaData,error) in
                
                if error != nil {
                    print(error)
                    return
                }
                
                imageRef.downloadURL { (url, error) in
                    if url != nil {
                        imageRef2.downloadURL { (url2, error) in
                            if url2 != nil {
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
}
