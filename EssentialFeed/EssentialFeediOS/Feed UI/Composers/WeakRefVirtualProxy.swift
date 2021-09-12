//
//  WeakRefVirtualProxy.swift
//  EssentialFeediOS
//
//  Created by Iván GalazJeria on 30-08-21.
//

import UIKit
import EssentialFeed

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
