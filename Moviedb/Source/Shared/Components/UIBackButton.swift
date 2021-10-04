//
//  UIBackButton.swift
//  Moviedb
//
//  Created by Hellen on 01/10/21.
//

import UIKit
import SnapKit

class UIBackButton: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var backButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.tintColor = .white
        return button
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Public Properties
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        backButton.addTarget(target, action: action, for: controlEvents)
    }
}

// MARK: - ViewCodeProtocol Extension

extension UIBackButton: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(backButton)
    }
    
    func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
    }
    
    func setupComponents() {
        backButton.accessibilityIdentifier = "backButtonId"
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
    }
}
