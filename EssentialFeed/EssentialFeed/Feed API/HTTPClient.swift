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
    
    /// The completion handler can be invoked in any thread.
    /// Clientes are responsible to dispatch  to appropriate threads, if needed.
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
