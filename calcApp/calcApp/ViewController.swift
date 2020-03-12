//
//  ViewController.swift
//  calcApp
//
//  Created by 尾原徳泰 on 2020/03/12.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var carModel = Car()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        carModel.frontWheel = 11
        carModel.reaWheel = 11
    }
    
    @IBAction func doAction(_ sender: Any) {
        carModel.drive()
        
        carModel.move(toBack: "後ろに行くよ")
        
        let total = carModel.plusAndMinus(num1: carModel.frontWheel, num2: carModel.reaWheel)
        
        print("タイヤの合計数\(total)")
    }
    

}

