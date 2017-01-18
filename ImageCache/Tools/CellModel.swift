//
//  CellModel.swift
//  ImageCache
//
//  Created by PSL on 1/17/17.
//  Copyright © 2017 PSL. All rights reserved.
//


import Foundation


struct CellModel {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
    init?(dict: Dictionary<String, AnyObject>?) {
        guard
            let albumId = dict?[PhotoKeys.albumId] as? Int,
            let id = dict?[PhotoKeys.id] as? Int,
            let title = dict?[PhotoKeys.title] as? String,
            let url = dict?[PhotoKeys.url] as? String,
            let thumbnailUrl = dict?[PhotoKeys.thumbnailUrl] as? String
            else {
                return nil
        }
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
}


struct PhotoKeys {
    static let albumId = "albumId"
    static let id = "id"
    static let title = "title"
    static let url = "url"
    static let thumbnailUrl = "thumbnailUrl"
}


