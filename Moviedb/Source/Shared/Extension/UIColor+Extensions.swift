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
    
    public class var gray: UIColor {
        return UIColor(red: 33, green: 37, blue: 41)
    }
    
    public class var gunmetal: UIColor {
        return UIColor(red: 52, green: 58, blue: 54)
    }
    
    public class var blackFogra: UIColor {
        return UIColor(red: 22, green: 22, blue: 22)
    }
    
    public class var darkness: UIColor {
        return UIColor(red: 13, green: 25, blue: 33)
    }
    
    public class var night: UIColor {
        return UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 0.4)
    }
    
    
    
}
