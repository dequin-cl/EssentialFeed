//
//  MainQueueDispatchDecorator.swift
//  EssentialFeediOS
//
//  Created by Iván GalazJeria on 30-08-21.
//

import EssentialFeed

final class MainQueueDispatchDecorator<T> {
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
