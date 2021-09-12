//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Iván GalazJeria on 29-08-21.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        dequeueReusableCell(withIdentifier: "\(T.self)") as! T
    }
}
