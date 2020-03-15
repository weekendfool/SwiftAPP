//
//  ViewController.swift
//  cameraAlbum
//
//  Created by 尾原徳泰 on 2020/03/15.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var backImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status) {
                
            case .authorized:
                print("許可されています")
                
            case .denied:
                print("拒否されています")
                
            case .notDetermined:
                print("notDetermined")
                
            case .restricted:
                print("restricted")
            }
        }
    }
    
    @IBAction func openCamera(_ sender: Any) {
        
        let sourceType = UIImagePickerController.SourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        
            let cameraPicker = UIImagePickerController()
            
            cameraPicker.sourceType = sourceType
            
            cameraPicker.delegate = self
            
            cameraPicker.allowsEditing = true
            
            present(cameraPicker, animated: true, completion: nil)
            
        } else {
            print("エラー")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func openAlbum(_ sender: Any) {
        
        let sourceType = UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        
            let cameraPicker = UIImagePickerController()
            
            cameraPicker.sourceType = sourceType
            
            cameraPicker.delegate = self
            
            cameraPicker.allowsEditing = true
            
            present(cameraPicker, animated: true, completion: nil)
            
        } else {
            print("エラー")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.editedImage] as? UIImage {
            
            backImageView.image = pickedImage
            
            UIImageWriteToSavedPhotosAlbum(pickedImage, self, nil, nil)
            
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func shareButton(_ sender: Any) {
        
        let text = ""
        
        let image = backImageView.image?.jpegData(compressionQuality: 0.2)
        
        let items = [text,image] as [Any]
        
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        present(activityVC, animated: true, completion: nil)
    }
    
}

