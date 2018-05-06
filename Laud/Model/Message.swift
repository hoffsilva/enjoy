//
//  Message.swift
//  Laud
//
//  Created by Hoff Henry Pereira da Silva on 06/05/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation
import UIKit

class Message {
    
    public var text: String?
    public var isBot: Bool?
    public var avatar: UIImage?
    
    init(text: String, isBot: Bool, avatar: UIImage) {
        self.text = text
        self.isBot = isBot
        self.avatar = avatar
    }
    
    init() {
        
    }
    
}
