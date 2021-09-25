//
// Copyright © 2021 dequin_cl. All rights reserved.
//

import EssentialFeed
import UIKit

public final class FeedUIComposer {
    private init() {}

    public static func feedComposedWith(loader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader: MainQueueDispatchDecorator(decorated: loader))

        let feedController = FeedViewController.makeWith(title: FeedPresenter.title)
        let refreshController = FeedRefreshViewController.makeFrom(feedController, with: presentationAdapter)

        presentationAdapter.presenter = FeedPresenter(
            feedView: FeedViewAdapter(controller: feedController, imageLoader: MainQueueDispatchDecorator(decorated: imageLoader)),
            loadingView: WeakRefVirtualProxy(refreshController),
            errorView: WeakRefVirtualProxy(feedController)
        )
        return feedController
    }
}

private extension FeedViewController {
    static func makeWith(title: String) -> FeedViewController {
        let bundle = Bundle(for: FeedViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)

        let feedController = storyboard.instantiateInitialViewController() as! FeedViewController
        feedController.title = title

        return feedController
    }
}

private extension FeedRefreshViewController {
    static func makeFrom(_ feedController: FeedViewController, with delegate: FeedLoaderPresentationAdapter) -> FeedRefreshViewController {
        let refreshController = feedController.refreshController!
        refreshController.delegate = delegate
        return refreshController
    }
}
