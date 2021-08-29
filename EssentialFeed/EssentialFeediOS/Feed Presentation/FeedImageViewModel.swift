//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Iván GalazJeria on 29-08-21.
//

import Foundation

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    var isLoading: Bool
    var shouldRetry: Bool
    
    var hasLocation: Bool {
        location != nil
    }
}
