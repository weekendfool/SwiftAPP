//
//  ViewController.swift
//  WKWebView
//
//  Created by 尾原徳泰 on 2020/03/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var webView = WKWebView()
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        webView.frame = CGRect(x: 0, y: toolBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height * 2)
        
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        
        let url = URL(string: "https://www.yahoo.co.jp/")
        
        let request = URLRequest(url: url!)
        
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        print("読み込み開始")
        
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("読み込み完了")
        
        indicator.stopAnimating()
    }
    

    @IBAction func goButton(_ sender: Any) {
        webView.canGoForward
    }
    
    @IBAction func backButton(_ sender: Any) {
        webView.canGoBack
    }
    
}

