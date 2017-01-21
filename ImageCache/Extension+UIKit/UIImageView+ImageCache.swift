//
//  UIImageView+ImageCache.swift
//  ImageCache
//
//  Created by PSL on 1/21/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit


// MARK: - associated object
private var lastUrl: String?

extension ImageCache where Base: UIImageView {
    public var lastUrlStr: String? {
        get {
            return objc_getAssociatedObject(base, &lastUrl) as? String
        }
        set {
            objc_setAssociatedObject(
                base,
                &lastUrl,
                newValue as String?,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

// MARK: -  nested call for UIImageView
extension ImageCache where Base: UIImageView {
    public func download(imageFrom urlStr: String,
                         placeHolder: String? = nil) {
        
        // Base is the imageView,
        // update Base with placeholder
        if let placeHolder = placeHolder {
            base.image = UIImage(named: placeHolder)
        } else {
            base.image = nil
        }
        self.lastUrlStr = urlStr
        ImageCacheManager.shared.download(imageFrom: urlStr) {
            (newImage, url) in
            
            if let validLastUrlStr = self.lastUrlStr,
                validLastUrlStr != url {
                print("ImCacheMan: ignore \(validLastUrlStr)")
                return
            }
            DispatchQueue.main.async {
                self.base.image = newImage
            }
        }
    }
}
