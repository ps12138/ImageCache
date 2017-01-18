//
//  MainViewController+Delegate.swift
//  ImageCache
//
//  Created by PSL on 1/17/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
}


// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    ///
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    ///
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    ///
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId)
        
        return UITableViewCell()
    }
}
