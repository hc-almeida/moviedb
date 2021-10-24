//
//  UIColor+Extensions.swift
//  Moviedb
//
//  Created by Hellen on 23/10/21.
//

import UIKit

extension UIColor {
    
    // MARK: - Init
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(
            red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: 1.0)
    }
    
    // MARK: - Public Properties
    
    public class var greenSwanp: UIColor {
        return UIColor(red: 0, green: 100, blue: 0)
    }
    
    public class var darkness: UIColor {
        return UIColor(red: 13, green: 25, blue: 33)
    }
    
    public class var night: UIColor {
        return UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 0.4)
    }
}
