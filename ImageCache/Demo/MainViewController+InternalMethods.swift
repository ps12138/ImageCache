//
//  MainViewController+InternalMethods.swift
//  ImageCache
//
//  Created by PSL on 1/17/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

// MARK: - internal methods
extension MainViewController {
    
    
    ///
    internal func fetch(testJsonFrom urlStr: String) {
        print("MainVC: fetch data")
        weak var weakself = self
        let workItem = DispatchWorkItem {
            HttpTools().get(jsonFrom: urlStr, reformer: Reformer().data) {
                (receivedData, error) in
                guard let validData = receivedData as? [CellModel] else {
                    return
                }
                print("MainVC: Received count = \(validData.count)")
                weakself?.model = validData
            }
        }
        DispatchQueue.global().async(execute: workItem)
    }
    ///
    internal func initNavController() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        //self.navigationItem.title = self.title
    }
    
    ///
    internal func initTableView(superView: UIView) {
        let tableView = UITableView(frame: superView.bounds)
        tableView.register(UINib(nibName: Constants.cellId, bundle: nil), forCellReuseIdentifier: Constants.cellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = Constants.estRowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        superView.addSubview(tableView)
        self.tableView = tableView
    }
}
