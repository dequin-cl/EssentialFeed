//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Iván GalazJeria on 06-08-21.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
