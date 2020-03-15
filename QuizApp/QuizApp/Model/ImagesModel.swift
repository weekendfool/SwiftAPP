//
//  ImagesModel.swift
//  QuizApp
//
//  Created by 尾原徳泰 on 2020/03/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class ImagesModel {
    
    let imageText: String
    
    let answer: Bool
    
    init(imageName: String, correcOrNot: Bool) {
        
        imageText = imageName
        
        answer = correcOrNot
    }
}
