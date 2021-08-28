//
//  FeedImageLoadController.swift
//  EssentialFeediOS
//
//  Created by Iván GalazJeria on 28-08-21.
//

import UIKit

final class FeedImageLoadController {
    private var task: FeedImageDataLoaderTask?
    private let imageLoader: FeedImageDataLoader
    
    init(imageLoader: FeedImageDataLoader) {
        self.imageLoader = imageLoader
    }
    
    func preload(from url: URL) {
        self.task = self.imageLoader.loadImageData(from: url) { _ in }
    }
    
    func load(from url: URL, completion: @escaping (UIImage?) -> Void) {
        self.task = self.imageLoader.loadImageData(from: url) { result in
            let data = try? result.get()
            completion(data.map(UIImage.init) ?? nil)
        }
    }
    
    func cancelLoad() {
        task?.cancel()
    }
}
