//
//  ImageCacheManager.swift
//  ImageCache
//
//  Created by PSL on 1/17/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

public class ImageCacheManager: NSObject {
    // MARK: - Sinpleton
    private override init() {
        super.init()
        inMemCache.countLimit = maxSize
        inMemCache.evictsObjectsWithDiscardedContent = true
        inMemCache.delegate = self
    }
    static let shared = ImageCacheManager()
    
    // MARK: - Proterties
    internal let maxSize = 30
    //internal let maxCost = 30000
    internal let inMemCache = NSCache<NSString, UIImage>()
    internal let curOperations = NSCache<NSString, Operation>()
    internal let operationQueue = OperationQueue()
    
    // MARK: - Cache Strategy
}
