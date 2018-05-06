//
//  Place.swift
//  Laud
//
//  Created by Hoff Henry Pereira da Silva on 06/05/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation
import UIKit

class Place {
    
    public var name: String?
    public var address: String?
    public var phone: String?
    public var images: [UIImage]?
    public var lat: Double?
    public var long: Double?
    
    init(name: String, address: String, phone: String, images: [UIImage], lat: Double, long: Double) {
        self.name = name
        self.address = address
        self.phone = phone
        self.images = images
        self.lat = lat
        self.long = long
    }
    
}
