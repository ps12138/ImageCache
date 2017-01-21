//
//  ImageModel.swift
//  ImageCache
//
//  Created by PSL on 1/20/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit
//import Realm
import RealmSwift

class RealmImageModel: Object {
    dynamic var urlStr: NSString?
    dynamic var data: Data?
    
    convenience init(urlStr: NSString, image: UIImage) {
        self.init()
        self.urlStr = urlStr
        self.data = UIImagePNGRepresentation(image)
    }

    /// setting primary key
    /// Declaring a primary key allows objects to be looked up and updated efficiently and enforces uniqueness for each value. Once an object with a primary key is added to a Realm, the primary key cannot be changed.
    override static func primaryKey() -> String? {
        return "urlStr"
    }
}


