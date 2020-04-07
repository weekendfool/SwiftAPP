//
//  EditAndPostViewController.swift
//  Swift5Firebase
//
//  Created by 尾原徳泰 on 2020/04/06.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

class EditAndPostViewController: UIViewController, UITextview {
    
    var passedImage = UIImage()
    var userName = String()
    var userImageString = String()
    var userImageData = Data()
    var userImgae = UIImage()
    
    let screenSize = UIScreen.main.bounds.size
    
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTextView.delegate = self as! UITextViewDelegate
        
        NotificationCenter.default.addObserver(self, selector: #selector(EditAndPostViewController.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(EditAndPostViewController.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
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
    
    @objc func keyboardWillShow(_ notification:NSNotification) {
        let kyeboardHeight = ((notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as Any) as AnyObject).cgRectValue.height
        
        messageTextField.frame.origin.y = screenSize.height - keyboardHeight - messageTextField.frame.height
        
        sendButton.frame.origin.y = screenSize.height - keyboardHeight - sendButton.frame.height
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func postAction(_ sender: Any) {
        
        let timeLineDB = Database.database().reference().child("timeLine").childByAutoId()
        
        let storage = Storage.storage().reference(forURL: "gs://fir-login-3deca.appspot.com/")
        
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
                                let timeLineInfo = ["userName":self.userName as Any, "userProfileImage":url?.absoluteString as Any, "contents":url2?.absoluteString as Any, "comment":self.commentTextView.text as Any, "postData":ServerValue.timestamp()] as [String:Any]
                                timeLineDB.updateChildValues(timeLineInfo)
                                
                                self.navigationController?.popViewController(animated: true)
                            }
                        }
                    }
                }
            }
        }
        
        uploadTask.resume()
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
