//
// Copyright © 2021 dequin_cl. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        dequeueReusableCell(withIdentifier: "\(T.self)") as! T
    }
}
