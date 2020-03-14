//
//  NextViewController.swift
//  ProtocolBasic
//
//  Created by 尾原徳泰 on 2020/03/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

protocol CatchProtocol {
    func catchData(count: Int)
}

class NextViewController: UIViewController {
    
    
    @IBOutlet weak var countLabel: UILabel!
    
    var count: Int = 0
    
    var delegate: CatchProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func plusAction(_ sender: Any) {
        
        count += 1
        
        countLabel.text = String(count)
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        
        delegate?.catchData(count: count)
        
        dismiss(animated: true, completion: nil)
    }
}
