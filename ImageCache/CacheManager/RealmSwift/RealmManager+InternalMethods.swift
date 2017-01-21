//
//  RealmManager+InternalMethods.swift
//  ImageCache
//
//  Created by PSL on 1/20/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import RealmSwift

// MARK - internal methods
extension RealmCache {
    
    /// search model for key
    internal func search(forKey urlStr: NSString) -> RealmImageModel? {
        let predicate = NSPredicate(format: "urlStr == %@", urlStr)
        do {
            let realm = try Realm()
            let resModel = realm.objects(RealmImageModel.self).filter(predicate)
            if !resModel.isEmpty {
                print("Realm.M: fetch in Realm")
                return resModel[0]
            }
        } catch let error as NSError {
            print("Realm.M: fail search - \(error.localizedDescription)")
            
        }
        return nil
    }
    
    /// remove model for key
    internal func remove(forObj obj: RealmImageModel) {
        do {
            let realm = try Realm()
            try realm.write(){
                realm.delete(obj)
            }
            print("Realm.M: remove")
        } catch let error as NSError{
            print("Realm.M: fail to remove \(error.localizedDescription)")
        }
    }

}
