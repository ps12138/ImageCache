//
//  Reformer.swift
//  ImageCache
//
//  Created by PSL on 1/17/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation


struct Reformer {
    func data(toCellModels data: Data) -> [CellModel]? {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) else {
            print("Reformer: Fail - data to cellModels")
            return nil
        }
        
        guard let jsonArray = json as? Array<Any> else {
            print("Reformer: fail JsonArray")
            return nil
        }
        var cellModels = [CellModel]()
        for jsonOne in jsonArray {
            if let dict = jsonOne as? Dictionary<String, AnyObject>,
               let model = CellModel(dict: dict) {
                cellModels.append(model)
            }
        }
        return cellModels
    }
}
