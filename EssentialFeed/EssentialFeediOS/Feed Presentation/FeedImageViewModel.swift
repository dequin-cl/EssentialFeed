//
// Copyright © 2021 dequin_cl. All rights reserved.
//

import Foundation

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    var isLoading: Bool
    var shouldRetry: Bool

    var hasLocation: Bool {
        location != nil
    }
}
