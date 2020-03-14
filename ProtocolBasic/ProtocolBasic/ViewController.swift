//
//  ViewController.swift
//  ProtocolBasic
//
//  Created by 尾原徳泰 on 2020/03/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CatchProtocol {
   
    @IBOutlet weak var label: UILabel!
    
    var cout = Int()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func catchData(count: Int) {
        label.text = String(count)
       }

    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! NextViewController
        
        nextVC.delegate = self
        
        
    }
    
}

