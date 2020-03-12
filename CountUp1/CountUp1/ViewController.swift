//
//  ViewController.swift
//  CountUp1
//
//  Created by 尾原徳泰 on 2020/03/12.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    var countNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //カウンタラベルに0を表示
        countLabel.text = "0"
    }

    @IBAction func countUpButton(_ sender: Any) {
        //カウンタのカウントアップ
        countNumber += 1
        //カウンタラベルに表示
        countLabel.text = String(countNumber)
        
        if countNumber >= 10 {
            changeTextColor()
        }
    }
    
    @IBAction func countDownButton(_ sender: Any) {
        //カウンタのカウントダウン
        countNumber -= 1
        //カウントラベルへ表示
        countLabel.text = String(countNumber)
        
        if countNumber <= 0 {
            resetColor()
        }
    }
    
    //色変更のメソッド作成
    func changeTextColor() {
        countLabel.textColor = .yellow
    }
    
    func resetColor() {
        countLabel.textColor = .white
    }
}

