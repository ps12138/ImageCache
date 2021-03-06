//
//  ImageCacheManager+Delegate.swift
//  ImageCache
//
//  Created by PSL on 1/18/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

extension ImageCacheManager: NSCacheDelegate {
    public func cache(_ cache: NSCache<AnyObject, AnyObject>, willEvictObject obj: Any) {
        print("ImageCache.M: inMem remove obj")
        if let model = obj as? InMemImageModel {
            inDiskCache.setObject(model.image, forKey: model.urlStr)
        }
    }
}
