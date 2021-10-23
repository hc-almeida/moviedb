//
//  UIFavoriteButton.swift
//  Moviedb
//
//  Created by Hellen on 22/10/21.
//

import UIKit

class UIFavoriteButton: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var contentView: UICircularView = {
        let circularView = UICircularView(frame: .zero)
        circularView.backgroundColor = .white
        return circularView
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
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
    
    // MARK: - Public Functions

    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        favoriteButton.addTarget(target, action: action, for: controlEvents)
    }
}

// MARK: - ViewCodeProtocol Extension

extension UIFavoriteButton: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(contentView)
        contentView.addSubview(favoriteButton)
    }
    
    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.bottom.right.equalToSuperview()
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.bottom.right.equalToSuperview()
        }
    }
    
    func setupComponents() {
//        favoriteButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
}
