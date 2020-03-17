//
//  NextViewController.swift
//  facebookLogin
//
//  Created by 尾原徳泰 on 2020/03/18.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import SDWebImage

class NextViewController: UIViewController {

    @IBOutlet weak var plofileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if UserDefaults.standard.object(forKey: "pictureURLString") != nil || (UserDefaults.standard.object(forKey: "displayName") != nil) {
            
            let imageString = UserDefaults.standard.object(forKey: "pictureURLString") as! String
            
            plofileImageView.sd_setImage(with: URL(string: imageString), completed: nil)
            
            plofileImageView.layer.cornerRadius = 20.0
            
            let displayName = UserDefaults.standard.object(forKey: "displayName") as! String
            
            userNameLabel.text = displayName
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    

  
}
