//
//  FeedImageCellController.swift
//  EssentialFeediOS
//
//  Created by Iván GalazJeria on 28-08-21.
//

import UIKit
import EssentialFeed

final class FeedImageCellController {
    private let model: FeedImage
    private let feedImageLoadController: FeedImageLoadController
    
    init(model: FeedImage, feedImageLoadController: FeedImageLoadController) {
        self.model = model
        self.feedImageLoadController = feedImageLoadController
    }
    
    func view() -> UITableViewCell {
        let cell = FeedImageCell()
        cell.locationContainer.isHidden = (model.location == nil)
        cell.locationLabel.text = model.location
        cell.descriptionLabel.text = model.description
        cell.feedImageView.image = nil
        cell.feedImageRetryButton.isHidden = true
        cell.feedImageContainer.startShimmering()

        let loadImage = { [weak self, weak cell] in
            guard let self = self else { return }
            
            self.feedImageLoadController.load(from: self.model.url) { [weak cell] image in
                cell?.feedImageView.image = image
                cell?.feedImageRetryButton.isHidden = (image != nil)
                cell?.feedImageContainer.stopShimmering()

            }
        }
        
        cell.onRetry = loadImage
        loadImage()
        
        return cell
    }
    
    func preload() {
        feedImageLoadController.preload(from: self.model.url)
    }
    
    func cancelLoad() {
        feedImageLoadController.cancelLoad()
    }
}
