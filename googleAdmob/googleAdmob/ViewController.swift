//
//  ViewController.swift
//  googleAdmob
//
//  Created by 尾原徳泰 on 2020/03/18.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    
    @IBOutlet weak var bannerView: GADBannerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544~1458002511"
        
        bannerView.rootViewController = self
        
        bannerView.load(GADRequest())
    }


}

