//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Iván GalazJeria on 05-08-21.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
