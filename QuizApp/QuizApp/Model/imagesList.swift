//
//  imagesList.swift
//  QuizApp
//
//  Created by 尾原徳泰 on 2020/03/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class ImagesList {
    
    var list = [ImagesModel]()
    
    init() {
        
        list.append(ImagesModel(imageName: "0", correcOrNot: true))
        list.append(ImagesModel(imageName: "1", correcOrNot: false))
        list.append(ImagesModel(imageName: "2", correcOrNot: false))
        list.append(ImagesModel(imageName: "3", correcOrNot: false))
        list.append(ImagesModel(imageName: "4", correcOrNot: true))
        list.append(ImagesModel(imageName: "5", correcOrNot: false))
        list.append(ImagesModel(imageName: "6", correcOrNot: true))
        list.append(ImagesModel(imageName: "7", correcOrNot: true))
        list.append(ImagesModel(imageName: "8", correcOrNot: false))
        list.append(ImagesModel(imageName: "9", correcOrNot: true))
        list.append(ImagesModel(imageName: "10", correcOrNot: true))
    }
}
