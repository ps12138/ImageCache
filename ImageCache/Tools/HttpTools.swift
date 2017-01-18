//
//  HttpRequest.swift
//  ImageCache
//
//  Created by PSL on 1/17/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

public class HttpTools {
    public func get(
        jsonFrom urlString: String,
                  reformer: ((Data) -> (Any?))? = nil,
                completion: @escaping (Any?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        print("HttpTs: perform get json")
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print("HttpTs: error : \(error?.localizedDescription)")
                completion(nil, error)
                return
            }
            guard let validData = data else {
                return
            }
            if let reformer = reformer {
                print("HttpTs: reformer json")
                completion(reformer(validData), error)
                return
            }
            print("HttpTs: complete validData")
            completion(validData, nil)
        }
        task.resume()
    }
}
