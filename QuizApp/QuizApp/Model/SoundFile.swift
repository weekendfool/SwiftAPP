//
//  SoundFile.swift
//  QuizApp
//
//  Created by 尾原徳泰 on 2020/03/15.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import AVFoundation

class SoundFile {
    
    var player: AVAudioPlayer?
    
    func playSound(fileName:String, extensionName:String) {
        
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
        
        do {
            
            player = try AVAudioPlayer(contentsOf: soundURL!)
            
            player?.play()
            
        } catch {
            print("エラー発生")
        }
    }
}
