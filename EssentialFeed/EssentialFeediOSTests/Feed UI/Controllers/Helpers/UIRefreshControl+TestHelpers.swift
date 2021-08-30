//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Iván GalazJeria on 28-08-21.
//

import UIKit

extension UIRefreshControl {

    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
