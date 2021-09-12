//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Iván GalazJeria on 12-09-21.
//

import Foundation

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}

