//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Iván GalazJeria on 12-09-21.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing(): endRefreshing()
    }
}

