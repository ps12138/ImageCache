//
//  MainViewController.swift
//  ImageCache
//
//  Created by PSL on 1/17/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import UIKit

// MARK: - properties
class MainViewController: UIViewController {
    
    
    // MARK: - Model
    internal var model = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    // MARK: - View
    internal weak var tableView: UITableView?
    
    // MARK: - Constants
    internal struct Constants {
        static let cellId = "OneTableViewCell"
    }
}
