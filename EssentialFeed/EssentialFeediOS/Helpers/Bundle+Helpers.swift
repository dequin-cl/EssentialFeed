//
// Copyright © 2021 dequin_cl. All rights reserved.
//

import Foundation

extension Bundle {
    static var current: Bundle {
        class __ {}
        return Bundle(for: __.self)
    }
}
