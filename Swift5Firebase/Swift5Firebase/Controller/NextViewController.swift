//
//  NextViewController.swift
//  Swift5Firebase
//
//  Created by 尾原徳泰 on 2020/04/03.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import SDWebImage

class NextViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var timeLineTableView: UITableView!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    var selectedImage = UIImage()
    
    var userName = String()
    var userImageData = Data()
    var userImage = UIImage()
    var commentString = String()
    var createData = String()
    var contentImageString = String()
    var userProfileImageString = String()
    
    var contentsArray = [Contents]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLineTableView.delegate = self
        timeLineTableView.dataSource = self

        if UserDefaults.standard.object(forKey: "userName") != nil {
            userName = UserDefaults.standard.object(forKey: "userName") as! String
        }
        
        if UserDefaults.standard.object(forKey: "userImage") != nil {
                   userImageData = UserDefaults.standard.object(forKey: "userImage") as! Data
            
            userImage = UIImage(data: userImageData)!
               }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = timeLineTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let profileImageView = cell.viewWithTag(1) as! UIImageView
        
        profileImageView.sd_setImage(with: URL(string: contentsArray[indexPath.row].profileImageString), completed: nil)
        
        profileImageView.layer.cornerRadius = 30.0
        
        let userNameLabel  = cell.viewWithTag(2) as! UILabel
        
        userNameLabel.text = contentsArray[indexPath.row].userNameString
        
        let dateLabel = cell.viewWithTag(3) as! UILabel
        
        dateLabel.text = contentsArray[indexPath.row].postDateString
        
        let contentImageView = cell.viewWithTag(4) as! UIImageView
        
        contentImageView.sd_setImage(with: URL(string: contentsArray[indexPath.row].contentImageString), completed: nil)
        
        let commentLabel = cell.viewWithTag(5) as! UILabel
        
        commentLabel.text = contentsArray[indexPath.row].commentString
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 494
    }
    
    @IBAction func cameraAction(_ sender: Any) {
        
        showAlert()
    }
    
    func doCamera() {
        let sourceType:UIImagePickerController.SourceType = .camera
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker,animated: true, completion: nil)
        }
    }
    
    func doAlbum() {
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker,animated: true, completion: nil)
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "選択", message: "どちらを使用しますか？", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "カメラ", style: .default) { (alert) in
            self.doCamera()
        }
        
        let action2 = UIAlertAction(title: "アルバム", style: .default) { (alert) in
        self.doAlbum()
    }
        let action3 = UIAlertAction(title: "キャンセル", style: .cancel)
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        selectedImage = info[.originalImage] as! UIImage
        
        let editPostVC = self.storyboard?.instantiateViewController(identifier: "editPost") as! EditAndPostViewController
        
        editPostVC.passedImage = selectedImage
        
        self.navigationController?.pushViewController(editPostVC, animated: true)
        
        picker.dismiss(animated: true, completion: nil)
    }
}
