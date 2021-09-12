//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Iván GalazJeria on 12-09-21.
//

import XCTest

struct FeedPresenter {
    init(view: Any) {
        
    }
}

final class FeedPresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessagesToView() {
        let (_, view) = makeSUT()
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedPresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedPresenter(view: view)
        trackForMemoryLeaks(view)
        return (sut, view)
    }
    
    private class ViewSpy {
        let messages = [Any]()
    }
}
