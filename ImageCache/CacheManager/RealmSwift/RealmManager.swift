//
//  RealmManager.swift
//  ImageCache
//
//  Created by PSL on 1/20/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit



public class RealmCache: NSObject {
    
    // MARK: - init
    override init() {
        self.countLimit = 10
        self.evictsObjectsWithDiscardedContent = true
        super.init()
    }
    
    // MARK: - properties
    /// set maxCount
    public var countLimit: Int
    
    /// set evicts strategy
    public var evictsObjectsWithDiscardedContent: Bool

    
    // MARK: - config
}






