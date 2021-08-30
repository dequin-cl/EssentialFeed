//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Iván GalazJeria on 28-08-21.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
