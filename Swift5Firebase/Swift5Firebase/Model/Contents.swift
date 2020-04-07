//
//  Contents.swift
//  Swift5Firebase
//
//  Created by 尾原徳泰 on 2020/04/03.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class Contents{
    
    var userNameString: String = ""
    var profileImageString: String = ""
    var contentImageString: String = ""
    var commentString: String = ""
    var postDateString: String = ""
    
    init(userNameString: String, profileImageString: String, contentImageString: String, commentString: String, postDateString: String) {
        self.userNameString = userNameString
        self.profileImageString = profileImageString
        self.contentImageString = contentImageString
        self.commentString = commentString
        self.postDateString = postDateString
    }
}
