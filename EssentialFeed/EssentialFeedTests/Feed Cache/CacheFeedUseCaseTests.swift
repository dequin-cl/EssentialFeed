//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Iván GalazJeria on 15-08-21.
//

import XCTest

class LocalFeedLoader {
    init(store: FeedStore) {
        
    }
}

class FeedStore {
    var deleteCacheFeedCallCount = 0
}

final class CacheFeedUseCaseTests:XCTestCase {
    
    func test() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        XCTAssertEqual(store.deleteCacheFeedCallCount, 0)
    }
}
