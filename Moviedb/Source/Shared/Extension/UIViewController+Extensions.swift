//
//  UIViewController+Extensions.swift
//  Moviedb
//
//  Created by Hellen on 28/08/21.
//

import UIKit

extension UIViewController {
    
    func showMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showLoading() {
        let container = UIView()
        let loadingView = UIView()
        let activityIndicator = UIActivityIndicatorView()
        
        container.tag = 1000
        container.frame = self.view.frame
        container.center = self.view.center
        container.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.8)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        loadingView.center = self.view.center
        loadingView.backgroundColor = UIColor(red: 0.27, green: 0.27, blue: 0.27, alpha: 0.8)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.color = .white
        activityIndicator.style = UIActivityIndicatorView.Style.large
        
        activityIndicator.center = CGPoint(
            x: loadingView.frame.size.width / 2,
            y: loadingView.frame.size.height / 2
        )
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        self.view.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        let seconds = 0.7
        let delay = seconds * Double(NSEC_PER_SEC)
        let dispatchTime = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
            if let viewWithTag = self.view.viewWithTag(1000) {
                viewWithTag.removeFromSuperview()
            }
        })
    }
}

