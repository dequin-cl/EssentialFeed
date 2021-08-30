//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Iván GalazJeria on 28-08-21.
//

import UIKit
import EssentialFeed

public final class FeedUIComposer {
    private init() {}
    
    public static func feedComposedWith(loader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader: MainQueueDispatchDecorator(decorated: loader))
        
        let feedController = FeedViewController.makeWith(title: FeedPresenter.title)
        let refreshController = FeedRefreshViewController.makeFrom(feedController, with: presentationAdapter)

        presentationAdapter.presenter = FeedPresenter(
            feedView: FeedViewAdapter(controller: feedController, imageLoader: MainQueueDispatchDecorator(decorated: imageLoader)),
            loadingView: WeakRefVirtualProxy(refreshController)
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
    static func makeFrom(_ feedController: FeedViewController, with delegate: FeedLoaderPresentationAdapter) -> FeedRefreshViewController{
        let refreshController = feedController.refreshController!
        refreshController.delegate = delegate
        return refreshController
    }
}
