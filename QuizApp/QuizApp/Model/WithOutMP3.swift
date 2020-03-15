//
//  WithOutMP3.swift
//  QuizApp
//
//  Created by 尾原徳泰 on 2020/03/15.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class withOutMP3: SoundFile {
    
    override func playSound(fileName: String, extensionName: String) {
        if  extensionName == "mp3" {
            print("このファイルは使用不可")
        }
        player?.play()
    }
}
