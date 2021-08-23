//
//  FeedViewController.swift
//  Prototype
//
//  Created by Iván GalazJeria on 23-08-21.
//

import UIKit

class FeedViewController: UITableViewController {

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedImageCell", for: indexPath)

        return cell
    }


}
