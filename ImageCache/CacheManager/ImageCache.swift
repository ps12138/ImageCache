//
//  ImageCache.swift
//  ImageCache
//
//  Created by PSL on 1/21/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

// MARK: - add nested relationship
public final class ImageCache<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

// MARK: - setting protocol
public protocol ImageCacheCompatible {
    associatedtype CompatibleType
    var ic: CompatibleType { get }
}

// MARK: - setting getter
public extension ImageCacheCompatible {
    public var ic: ImageCache<Self> {
        return ImageCache(self)
    }
}

// MARK: - add nested class to UIImageView
extension UIImageView: ImageCacheCompatible { }





