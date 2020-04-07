//
//  LoginViewController.swift
//  Swift5Firebase
//
//  Created by 尾原徳泰 on 2020/04/03.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        Auth.auth().signInAnonymously { (AuthResult, error) in
            let user = AuthResult?.user
            print(user)
            
            let inputVC = self.storyboard?.instantiateViewController(identifier: "inputVC") as! InputViewController
            
            self.navigationController?.pushViewController(inputVC, animated: true)
        }
    }
    
  
}
