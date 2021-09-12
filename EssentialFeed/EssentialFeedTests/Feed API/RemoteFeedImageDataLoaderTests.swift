//
//  RemoteFeedImageDataLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Iván GalazJeria on 12-09-21.
//

import XCTest
import EssentialFeed

struct RemoteFeedImageDataLoader {
    init(client: Any) {
        
    }
}

final class RemoteFeedImageDataLoaderTests: XCTestCase {
    
    func test_init_doesNotPerformAnyURLRequest() {
        let client = HTTPClientSpy()
        let _ = RemoteFeedImageDataLoader(client: client)
        
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    // MARK:- Helpers
    
    private class HTTPClientSpy {
        var requestedURLs = [URL]()
    }
}
