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

private final class MainQueueDispatchDecorator<T> {
    private let decorated: T
    
    init(decorated: T) {
        self.decorated = decorated
    }
    
    func dispatch(completion: @escaping () -> Void) {
        guard Thread.isMainThread  else {
            return DispatchQueue.main.async(execute: completion)
        }

        completion()
    }
}

extension MainQueueDispatchDecorator: FeedLoader where T == FeedLoader {
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        decorated.load { [weak self] result in
            self?.dispatch { completion(result) }
        }
    }
}

extension MainQueueDispatchDecorator: FeedImageDataLoader where T == FeedImageDataLoader {
    func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
        decorated.loadImageData(from: url) { [weak self] result in
            self?.dispatch { completion(result) }
        }
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

private final class WeakRefVirtualProxy<Type: AnyObject> {
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

private final class FeedViewAdapter: FeedView {
    private weak var controller: FeedViewController?
    private let imageLoader: FeedImageDataLoader
    
    init(controller: FeedViewController, imageLoader: FeedImageDataLoader) {
        self.controller = controller
        self.imageLoader = imageLoader
    }
    
    func display(_ viewModel: FeedViewModel) {
        controller?.tableModel = viewModel.feed.map { model in
            let adapter = FeedImageDataLoaderPresentationAdapter<WeakRefVirtualProxy<FeedImageCellController>, UIImage>(model: model, imageLoader: imageLoader)
            let view = FeedImageCellController(delegate: adapter)
            adapter.presenter = FeedImagePresenter(view: WeakRefVirtualProxy(view),
                                                   imageTransformer: UIImage.init)
            return view
        }
    }
}

extension WeakRefVirtualProxy: FeedImageView where Type: FeedImageView, Type.Image == UIImage {
    func display(_ viewModel: FeedImageViewModel<UIImage>) {
        object?.display(viewModel)
    }
}

private final class FeedLoaderPresentationAdapter: FeedRefreshViewControllerDelegate {
    private let feedLoader: FeedLoader
    var presenter: FeedPresenter?
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    func didRequestFeedRefresh() {
        presenter?.didStartLoadingFeed()
        
        feedLoader.load { [weak self] result in
            switch result {
            case let .success(feed):
                self?.presenter?.didFinishLoadingFeed(with: feed)
            case let .failure(error):
                self?.presenter?.didFinishLoading(with: error)
            }
        }
    }
}

private final class FeedImageDataLoaderPresentationAdapter<View: FeedImageView, Image>: FeedImageCellControllerDelegate where View.Image == Image {
    private let model: FeedImage
    private let imageLoader: FeedImageDataLoader
    private var task: FeedImageDataLoaderTask?
    
    var presenter: FeedImagePresenter<View, Image>?
    
    init(model: FeedImage, imageLoader: FeedImageDataLoader) {
        self.model = model
        self.imageLoader = imageLoader
    }
    
    func didRequestImage() {
        presenter?.didStartLoadingImageData(for: model)

        let model = self.model
        task = imageLoader.loadImageData(from: model.url) { [weak self] result in
            switch result {
            case let .success(data):
                self?.presenter?.didFinishLoadingImageData(with: data, for: model)
                
            case let .failure(error):
                self?.presenter?.didFinishLoadingImageData(with: error, for: model)
            }
        }
    }
    
    func didCancelImageRequest() {
        task?.cancel()
    }
    
    
}
