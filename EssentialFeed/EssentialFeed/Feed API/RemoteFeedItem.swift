//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Iván GalazJeria on 16-08-21.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
