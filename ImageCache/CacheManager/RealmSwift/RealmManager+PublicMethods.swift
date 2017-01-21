//
//  RealmManager+PublicMethods.swift
//  ImageCache
//
//  Created by PSL on 1/20/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

// MARK: - public methods
extension RealmCache {
    
    
    /// fetch image by urlStr
    public func object(forKey urlStr: NSString) -> UIImage? {
        
        guard let res = search(forKey: urlStr),
              let data = res.data
            else {
                return nil
        }
        if let image = UIImage(data: data) {
            return image
        }
        print("Realm.M: fail to object forKey \(urlStr)")
        return nil
    }
    

    /// add image by urlStr
    public func setObject(_ image: UIImage, forKey urlStr: NSString) {
        
        let newImageModel = RealmImageModel(urlStr: urlStr, image: image)
        do {
            let realm = try Realm()
            try realm.write(){
                realm.add(newImageModel, update: true)
            }
            print("Realm.M: add to realm")
        } catch let error as NSError{
            print("Realm.M: fail to add \(error.localizedDescription)")
        }
    }
    
    
    /// remove image by urlStr
    public func removeObject(forKey urlStr: NSString) {
        
        guard let model = self.search(forKey: urlStr) else {
            return
        }
        remove(forObj: model)
    }
    
    /// remove all image
    public func removeAllObjects() {
        do {
            let realm = try Realm()
            try realm.write(){
                realm.deleteAll()
            }
            print("Realm.M: remove all")
        } catch let error as NSError{
            print("Realm.M: fail to remove all \(error.localizedDescription)")
        }
    }
}
