//
//  ViewController.swift
//  tableView
//
//  Created by 尾原徳泰 on 2020/03/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.selectionStyle = .none
        
        cell.textLabel?.text = textArray[indexPath.row]
        
        cell.imageView!.image = UIImage(named: "chekImage")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextCV = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
        
        nextCV.toDoString = textArray[indexPath.row]
        
        navigationController?.pushViewController(nextCV, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/6
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textArray.append(textField.text!)
        
        textField.resignFirstResponder()
        
        textField.text = ""
        
        tableView.reloadData()
        
        return true
    }
}

