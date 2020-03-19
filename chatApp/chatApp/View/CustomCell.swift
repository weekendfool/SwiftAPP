//
//  CustomCell.swift
//  chatApp
//
//  Created by 尾原徳泰 on 2020/03/20.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
