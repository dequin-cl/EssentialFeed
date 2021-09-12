//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Iván GalazJeria on 28-08-21.
//

import UIKit

protocol FeedRefreshViewControllerDelegate {
    func didRequestFeedRefresh()
}

final class FeedRefreshViewController: NSObject, FeedLoadingView {
    @IBOutlet private var view: UIRefreshControl?
    
    var delegate: FeedRefreshViewControllerDelegate?
    
    @IBAction func refresh() {
        delegate?.didRequestFeedRefresh()
    }
    
    func display(_ viewModel: FeedLoadingViewModel) {
        view?.update(isRefreshing: viewModel.isLoading)
    }
}
