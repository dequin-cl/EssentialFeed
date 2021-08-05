//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Iván GalazJeria on 05-08-21.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
