//
//  MutableAttributedString+Extensions.swift
//  Moviedb
//
//  Created by Hellen on 04/10/21.
//

import UIKit

extension NSMutableAttributedString {

    @discardableResult
    public func bold(_ text: String) -> NSMutableAttributedString {
        let defaultFont: UIFont = .systemFont(ofSize: 16.0, weight: .bold)
        let attrs = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): defaultFont]
        let bigString = NSMutableAttributedString(string: "\(text)", attributes: attrs)
        self.append(bigString)
        return self
    }

    @discardableResult
    public func normal(_ text: String) -> NSMutableAttributedString {
        let defaultFont: UIFont = .systemFont(ofSize: 14.0)
        let attrs: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: defaultFont]
        let normal = NSMutableAttributedString(string: "\(text)", attributes: attrs)
        self.append(normal)
        return self
    }
}
