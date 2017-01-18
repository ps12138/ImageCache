//
//  DwOperation.swift
//  ImageCache
//
//  Created by PSL on 1/17/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

class DwOperation: Operation {
    
    // MARK: - Properties
    var downloadedImage: UIImage?
    var urlStr: NSString?
    
    // MARK: - func for running
    override func main() -> Void {
        guard
            let validUrlStr = urlStr,
            let validUrl = URL(string: validUrlStr as String)
            else {
            return
        }
        // if cancelled itself
        if (self.isCancelled) {
            return
        }
        // tring to download the data and transfer to UIImage
        if let data = try? Data(contentsOf: validUrl),
            let newImage = UIImage(data: data) {
            self.downloadedImage = newImage
        }
    }
}
