//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Iván GalazJeria on 12-09-21.
//

import Foundation

public struct FeedErrorViewModel {
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}
