//
//  UITableView+Extensions.swift
//  GHFollowers
//
//  Created by Muhammad Shayan on 12/10/2024.
//

import UIKit


extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
