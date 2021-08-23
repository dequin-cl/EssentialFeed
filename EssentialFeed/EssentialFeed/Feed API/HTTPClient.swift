//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Iván GalazJeria on 06-08-21.
//

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>

    /// The completion handler can be invoked in any thread.
    /// Clientes are responsible to dispatch  to appropriate threads, if needed.
    func get(from url: URL, completion: @escaping (Result) -> Void)
}
