//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Iván GalazJeria on 28-08-21.
//

import UIKit

extension UIButton {
    
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}

