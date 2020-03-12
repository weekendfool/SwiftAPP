//
//  Car.swift
//  calcApp
//
//  Created by 尾原徳泰 on 2020/03/12.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class Car {
    
    var frontWheel = 0
    
    var reaWheel = 0
    
    /*
    init(){
        
        frontWheel = 2
        
        reaWheel = 2
    }
    */
    func drive() {
        print("運転開始")
        
        print("前輪：\(frontWheel)")
        
        print("後輪：\(reaWheel)")
    }
    
    func move(toBack: String) {
        print(toBack)
    }
    
    func plusAndMinus(num1: Int, num2: Int) -> Int {
        
        return num1 + num2 
    }
}
