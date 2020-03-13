//
//  ViewController.swift
//  goView
//
//  Created by 尾原徳泰 on 2020/03/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func plusButton(_ sender: Any) {
        
        count += 1
        
        countLabel.text = String(count)
        
        if count == 10 {
            
            //count = 0
            
//            countLabel.text = String(count)
            
//            performSegue(withIdentifier: "next", sender: nil)
            let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
            navigationController?.pushViewController(nextVC, animated: true)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! NextViewController
        
        nextVC.giveCount = count
    }
    
}

