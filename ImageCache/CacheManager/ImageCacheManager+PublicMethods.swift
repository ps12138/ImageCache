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
    func download(imageFrom urlStr: String,
                  completion: @escaping (UIImage, String)->()
        ) {
        
        let urlStr = urlStr as NSString
        // if urlStr is currently downloading
        if let _ = curOperations.object(forKey: urlStr){
            return
        }
        // if urlStr is in the inMemCache
        if let newImage = inMemCache.object(forKey: urlStr) {
            completion(newImage, urlStr as String)
            return
        }
        // we will begin a task into operation queue
        let task = DwOperation()
        curOperations.setObject(task, forKey: urlStr)
        
        // open a operation to download the image
        task.urlStr = urlStr
        weak var weakTask = task
        task.completionBlock = {
            if let newImage = weakTask?.downloadedImage,
                let validUrlStr = weakTask?.urlStr {
                self.inMemCache.setObject(newImage, forKey: validUrlStr)
                completion(newImage, validUrlStr as String)
            }
        }
        operationQueue.addOperation(task)
        
    }
    
    /// clear in mem cache
    func clearInMemCache() {
        inMemCache.removeAllObjects()
    }

}
