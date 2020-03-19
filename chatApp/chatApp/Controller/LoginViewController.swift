//
//  LoginViewController.swift
//  chatApp
//
//  Created by 尾原徳泰 on 2020/03/20.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase
import Lottie

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
      let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil {
                
                print(error as Any)
                
            } else {
                
                print("ログイン成功")
                
                self.stopAnimation()
                
                self.performSegue(withIdentifier: "chat", sender: nil)
            }
        }
    }
    

    func startAnimation() {
           
           let animation = Animation.named("loading")
           
           animationView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/1.5)
           
           animationView.animation = animation
           
           animationView.loopMode = .loop
           
           animationView.play()
           
           view.addSubview(animationView)
           
       }
       
       func stopAnimation() {
           
           animationView.removeFromSuperview()
       }
      
   

}
