//
//  NextViewController.swift
//  tableView
//
//  Created by 尾原徳泰 on 2020/03/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var todoLabel: UILabel!
    
    var toDoString = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        todoLabel.text = toDoString
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
