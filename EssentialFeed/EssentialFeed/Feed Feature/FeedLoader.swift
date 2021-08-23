//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Iván GalazJeria on 05-08-21.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
