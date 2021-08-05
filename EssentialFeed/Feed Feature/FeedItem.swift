//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Iván GalazJeria on 05-08-21.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
