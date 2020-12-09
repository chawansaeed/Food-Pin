//
//  Restaurant.swift
//  Food Pin
//
//  Created by Chawan Saeed on 11/8/20.
//  Copyright © 2020 Chawan Saeed. All rights reserved.
//

import Foundation

class Restaurant {
    
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    var phone = ""
    var rating = ""
    
    init(name: String, type: String, location: String,  phone: String, image: String, isVisited: Bool) {
        
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
        self.phone = phone
 }
}
