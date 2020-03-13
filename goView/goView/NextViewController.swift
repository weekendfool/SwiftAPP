//
//  NextViewController.swift
//  goView
//
//  Created by 尾原徳泰 on 2020/03/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var giveCountNumber: UILabel!
    
    var giveCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        giveCountNumber.text = String(giveCount)
    }
    
 
    
  

}
