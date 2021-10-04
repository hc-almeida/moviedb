//
//  UIView+Extension.swift
//  Moviedb
//
//  Created by Hellen on 04/10/21.
//

import UIKit

extension UIView {
    
    func addBlurToView() {
        var blurEffect: UIBlurEffect!
        
        blurEffect = UIBlurEffect(style: .dark)
        
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = self.bounds
        blurredEffectView.alpha = 1
        blurredEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurredEffectView)
    }
}
