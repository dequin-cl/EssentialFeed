//
//  Bundle+Helpers.swift
//  EssentialFeediOS
//
//  Created by Iván GalazJeria on 12-09-21.
//

import Foundation

extension Bundle {
    static var current: Bundle {
        class __ { }
        return Bundle(for: __.self)
    }
}
