//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Iván GalazJeria on 22-08-21.
//

import Foundation

final public class CoreDataFeedStore: FeedStore {
    public init() {}
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }

    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }

    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
    }
}
