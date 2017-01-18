//
//  MainViewController+LifeCycle.swift
//  ImageCache
//
//  Created by PSL on 1/17/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
    ///
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavController()
        initTableView(superView: self.view)
        fetch(testJsonFrom: Constants.fetchUrl)
    }
    
    ///
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    /// 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    ///
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
