//
// Copyright © 2021 dequin_cl. All rights reserved.
//

import EssentialFeed
import UIKit

final class WeakRefVirtualProxy<Type: AnyObject> {
    private weak var object: Type?

    init(_ object: Type) {
        self.object = object
    }
}

extension WeakRefVirtualProxy: FeedLoadingView where Type: FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel) {
        object?.display(viewModel)
    }
}

extension WeakRefVirtualProxy: FeedImageView where Type: FeedImageView, Type.Image == UIImage {
    func display(_ viewModel: FeedImageViewModel<UIImage>) {
        object?.display(viewModel)
    }
}

extension WeakRefVirtualProxy: FeedErrorView where Type: FeedErrorView {
    func display(_ viewModel: FeedErrorViewModel) {
        object?.display(viewModel)
    }
}
