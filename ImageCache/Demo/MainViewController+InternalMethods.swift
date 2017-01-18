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
    internal func initNavController() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        //self.navigationItem.title = self.title
    }
    
    ///
    internal func initTableView(superView: UIView) {
        let tableView = UITableView(frame: superView.frame)
        let cellNib = UINib(nibName: Constants.cellId, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Constants.cellId)
        tableView.delegate = self
        tableView.dataSource = self
        superView.addSubview(tableView)
        self.tableView = tableView
    }
}
