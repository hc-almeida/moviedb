//
//  UICircularView.swift
//  Moviedb
//
//  Created by Hellen on 22/10/21.
//

import UIKit

class UICircularView: UIView {
    
    // MARK: - Public Properties
    
    var borderedWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = self.borderedWidth
        }
    }
    
    var borderedColor: UIColor = .lightGray {
        didSet {
            self.layer.borderColor = self.borderedColor.cgColor
        }
    }
    
    var shadowColored: UIColor? = .black {
        didSet {
            self.layer.shadowColor = self.shadowColored?.cgColor
        }
    }
    
    var shadowRadius: CGFloat = 3.0 {
        didSet {
            self.layer.shadowRadius = self.shadowRadius
            self.layer.shadowPath = self.bezierPath.cgPath
        }
    }
    
    var shadowOpacity: Float = 0.3 {
        didSet {
            self.layer.shadowOpacity = self.shadowOpacity
        }
    }
    
    var shadowOffset: CGSize = CGSize(width: 1.0, height: 1.0) {
        didSet {
            self.layer.shadowOffset = self.shadowOffset
        }
    }
    
    // MARK: - Private Properties
    
    private var bezierPath: UIBezierPath {
        let path = UIBezierPath(
            roundedRect: self.bounds,
            cornerRadius: self.frame.width / 2)
        return path
    }
    
    // MARK: - View Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    // MARK: - Private Functions
    
    private func setupUI() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = self.borderedWidth
        self.layer.borderColor = self.borderedColor.cgColor
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowRadius = self.shadowRadius
        self.layer.shadowPath = self.bezierPath.cgPath
        self.layer.shadowOpacity = self.shadowOpacity
        self.layer.shadowColor = self.shadowColored?.cgColor
    }
}
