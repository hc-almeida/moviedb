//
//  ViewCodeProtocol.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import Foundation

protocol ViewCodeProtocol {
    
    func setupSubviews()
    
    func setupConstraints()
    
    func setupComponents()
}

extension ViewCodeProtocol {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupComponents()
    }
    
    func setupComponents() {}
}
