//
//  InMemImageCahce.swift
//  ImageCache
//
//  Created by PSL on 1/20/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit


class InMemImageModel {
    var urlStr: NSString
    var image: UIImage
    
    init(urlStr: NSString, image: UIImage) {
        self.urlStr = urlStr
        self.image = image
    }
    
}
