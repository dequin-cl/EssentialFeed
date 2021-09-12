//
//  UIImageView+Animations.swift
//  EssentialFeediOS
//
//  Created by Iván GalazJeria on 29-08-21.
//

import UIKit

extension UIImageView {
    func setImageAnimated(_ newImage: UIImage?) {
        image = newImage
        
        guard newImage != nil else { return }
        
        alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
}
