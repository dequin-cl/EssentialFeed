//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Iván GalazJeria on 05-08-21.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
