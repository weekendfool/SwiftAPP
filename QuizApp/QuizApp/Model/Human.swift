//
//  Human.swift
//  QuizApp
//
//  Created by 尾原徳泰 on 2020/03/15.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class Human: Animal {
    
    override func breth() {
        
        super.breth()
        profile()
    }
    
    func profile() {
        print("I am Human")
    }
    
}
