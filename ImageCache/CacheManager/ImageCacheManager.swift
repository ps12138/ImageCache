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
        // setting inMemCache
        inMemCache.countLimit = inMemSize
        inMemCache.evictsObjectsWithDiscardedContent = true
        inMemCache.delegate = self
        
        // setting inDiskCache
        inDiskCache.countLimit = inDiskSize
        inDiskCache.evictsObjectsWithDiscardedContent = true
        
        // setting ioerationQueue
        operationQueue.underlyingQueue = dispathQueue
        operationQueue.maxConcurrentOperationCount = 3
        operationQueue.name = "ImageDownLoad"
        
    }
    static let shared = ImageCacheManager()
    
    // MARK: - Proterties
    internal let inMemSize = 10
    internal let inDiskSize = 10
    
    // MARK: - Operation control
    internal let curOperations = NSCache<NSString, Operation>()
    internal let operationQueue = OperationQueue()
    internal let dispathQueue = DispatchQueue(label: Constants.dispathQueueName, attributes: DispatchQueue.Attributes.concurrent)
    
    // MARK: - Cache
    internal let inMemCache = NSCache<NSString, InMemImageModel>()
    internal let inDiskCache = RealmCache()
    
    // MARK: - Constants
    internal struct Constants {
        static let opQueueName = "ImageDownLoad"
        static let dispathQueueName = "ImageDownLoad"
    }
}
