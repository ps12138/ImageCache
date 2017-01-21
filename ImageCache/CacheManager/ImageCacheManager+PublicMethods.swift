//
//  ImageCacheManager+PublicMethods.swift
//  ImageCache
//
//  Created by PSL on 1/17/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Public Methods
extension ImageCacheManager {
    
    /// download image from url string
    /**
    - Parameters:
        - imageFrom : url String of image: String
        - completion: 
            - UIImage: downloaded iamge
            - String: download from url string
    */
    public func download(imageFrom urlStr: String,
                  completion: @escaping (UIImage, String)->()
        ) {
        
        let urlStr = urlStr as NSString
        
        // if urlStr is currently downloading
        if let _ = curOperations.object(forKey: urlStr){
            print("ImageCache.M: loading")
            return
        }
        
        // if urlStr is in the inMemCache
        if let model = inMemCache.object(forKey: urlStr) {
            print("ImageCache.M: inMem cached")
            completion(model.image, urlStr as String)
            return
        }

        // if urlStr is in the inDiskCache
        if let newImage = inDiskCache.object(forKey: urlStr) {
            print("ImageCache.M: inDisk cached")
            completion(newImage, urlStr as String)
            return
        }
        
        
        
        
        // we will begin a task into operation queue
        let task = DwOperation()
        curOperations.setObject(task, forKey: urlStr)
        task.urlStr = urlStr
        weak var weakTask = task
        task.completionBlock = {
            if let newImage = weakTask?.downloadedImage,
                let validUrlStr = weakTask?.urlStr {
                //self.inMemCache.setObject(newImage, forKey: validUrlStr)
                self.inMemCache.setObject(
                    InMemImageModel(urlStr: validUrlStr, image: newImage),
                    forKey: validUrlStr)
                //self.inDiskCache.setObject(newImage, forKey: validUrlStr)
                self.curOperations.removeObject(forKey: validUrlStr)
                print("ImageCache.M: inMem")
                completion(newImage, validUrlStr as String)
            }
        }
        operationQueue.addOperation(task)
    }
    
    /// setting inMem maxCount
    public func set(inMemCount count: Int) {
        inMemCache.countLimit = count
    }
    
    /// setting inMem maxCost
    public func set(inMemCost cost: Int) {
        inMemCache.totalCostLimit = cost
    }
    
    /// setting inMem maxCount
    public func set(inDiskCount count: Int) {
        inDiskCache.countLimit = count
    }
    
    /// clear in mem cache
    public func clearInMemCache() {
        inMemCache.removeAllObjects()
    }
    
    /// clear disk cache
    public func clearInDiskCache() {
        inDiskCache.removeAllObjects()
    }

}
