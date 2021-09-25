//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Iván GalazJeria on 18-08-21.
//

import Foundation


func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    Data("any data".utf8)
}
