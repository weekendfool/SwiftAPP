//
//  DetailViewController.swift
//  Swift5Firebase
//
//  Created by 尾原徳泰 on 2020/04/07.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var userName = String()
    var contentImage = String()
    var date = String()
    var profileImage = String()
    var comment = String()
    

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var contentsImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shareButton.layer.cornerRadius = 20.0
        
        profileImageView.sd_setImage(with: URL(string: profileImage), completed: nil)
        
        userNameLabel.text = userName
        dateLabel.text = date
        
        contentsImageView.sd_setImage(with: URL(string: profileImage), completed: nil)
        
        commentLabel.text = comment
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        let items = [profileImage] as Any
        
        let acView = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        
        present(acView, animated: true, completion: nil)
    }
    
    
}
