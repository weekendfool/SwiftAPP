//
//  LoginMovieViewController.swift
//  IntoroApp
//
//  Created by 尾原徳泰 on 2020/04/08.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import AVFoundation

class LoginMovieViewController: UIViewController {
    
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "start.mov", ofType: "拡張子")
        
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.repeatCount = 0
        playerLayer.zPosition = -1
        view.layer.insertSublayer(playerLayer, at: 0)
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { (_) in
            self.player.seek(to: .zero)
            
            self.player.play()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
    }
   
    @IBAction func login(_ sender: Any) {
        player.pause()
    }
    
}
