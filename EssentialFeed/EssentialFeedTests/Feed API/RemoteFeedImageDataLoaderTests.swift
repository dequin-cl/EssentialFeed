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
        let (_, client) = makeSUT()
        
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    // MARK:- Helpers
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> (sut:RemoteFeedImageDataLoader, client:HTTPClientSpy){
        let client = HTTPClientSpy()
        let sut = RemoteFeedImageDataLoader(client: client)
        trackForMemoryLeaks(client, file: file, line: line)
        return (sut, client)
    }
    
    private class HTTPClientSpy {
        var requestedURLs = [URL]()
    }
}
