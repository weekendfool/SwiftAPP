//
//  ViewController.swift
//  Timer1
//
//  Created by 尾原徳泰 on 2020/03/12.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var startButtonImge: UIButton!
    
    @IBOutlet weak var stopButtonImage: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //stopButtonをあ押せなくする
        stopButtonImage.isEnabled = true
        
        count = 0
        
        for i in 0 ..< 5 {
            
            print(i)
            
            let image = UIImage(named: "\(i)")
            
            imageArray.append(image!)
        }
        
        imageView.image = imageArray[0]
    }
    
    func startTimer() {
        //
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdata), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdata() {
        count += 1
        
        imageView.image = imageArray[count % 4]
    }

    @IBAction func startButton(_ sender: Any) {
        //starButtonをおせなくする
        startButtonImge.isEnabled = false
        
        stopButtonImage.isEnabled = true
        
        startTimer()
    }
    
    @IBAction func stopButton(_ sender: Any) {
        //stopButtonを押せなくする
        stopButtonImage.isEnabled = false
        
        startButtonImge.isEnabled = true
        
        timer.invalidate()
        
    }
    
    
}

