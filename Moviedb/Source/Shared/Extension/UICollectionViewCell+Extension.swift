//
//  UICollectionViewCell+Extension.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import UIKit

extension UICollectionViewCell {
    
    static func registerOn(_ collectionView: UICollectionView) {
        let reuseIdentifier = String(describing: self.self)
        collectionView.register(self.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
