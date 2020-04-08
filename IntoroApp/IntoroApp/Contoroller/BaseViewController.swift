//
//  BaseViewController.swift
//  IntoroApp
//
//  Created by 尾原徳泰 on 2020/04/08.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import SegementSlide

class BaseViewController: SegementSlideViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        reloadData()
        scrollToSlide(at: 0, animated: true)
    }
    
    override var headerView: UIView? {
        let headerView = UIImageView()
        headerView.isUserInteractionEnabled = true
        headerView.contentMode = .scaleToFill
        headerView.image = UIImage(named: "header")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        let headerHight:CGFloat
        
        if #available(iOS 11.0, *) {
            headerHight = view.bounds.height / 4 + view.safeAreaInsets.top
        } else {
            headerHight = view.bounds.height / 4 + topLayoutGuide.length
        }
        
        headerView.heightAnchor.constraint(equalToConstant: headerHight).isActive = true
        return headerView
    }
    
    override var titlesInSwitcher: [String] {
        return ["TOP", "AbemaNews", "Yahoo!!", "IT", "Buzz", "CNN"]
    }
    
    func segementSlideContentScrollView(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        switch index {
        case 0:
            return Page1ViewController()
        case 1:
            return Page2ViewController()
        case 2:
            return Page3ViewController()
        case 3:
            return Page4ViewController()
        case 4:
            return Page5ViewController()
        case 5:
            return Page6ViewController()
            
        default:return Page1ViewController()
        }
    }

}
