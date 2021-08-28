//
//  UIImageView+Extensions.swift
//  Moviedb
//
//  Created by Hellen on 22/08/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func load(url: String, completion: (() -> Void)? = nil) {
        kf.setImage(
            with: URL(string: url),
            options: [.transition(.fade(0.3))], completionHandler: { _ in
                completion?()
            })
    }
    
    func cancel() {
        kf.cancelDownloadTask()
    }
}
