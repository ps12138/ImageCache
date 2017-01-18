//
//  ImageCacheManager.swift
//  ImageCache
//
//  Created by PSL on 1/17/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

public class ImageCacheManager {
    // MARK: - Sinpleton
    private init() {}
    static let shared = ImageCacheManager()
    
    // MARK: - Proterties
    internal let inMemCache = NSCache<NSString, UIImage>()
    internal let curOperations = NSCache<NSString, Operation>()
    internal let operationQueue = OperationQueue()
}
