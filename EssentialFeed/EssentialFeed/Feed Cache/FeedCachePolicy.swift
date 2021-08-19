//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Iván GalazJeria on 19-08-21.
//

import Foundation

enum FeedCachePolicy {
    
    private static let calendar = Calendar(identifier: .gregorian)
    private static var maxCacheAgeInDays: Int { 7 }

    static func validate(_ timestamp: Date, against date: Date) -> Bool {
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else {
            return false
        }
        return date < maxCacheAge
    }
}
