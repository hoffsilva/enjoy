//
//  UserSingleton.swift
//  Laud
//
//  Created by Hoff Henry Pereira da Silva on 06/05/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

class UserSingleton {
    
    static var shared: User {
        return User()
    }
    
}
