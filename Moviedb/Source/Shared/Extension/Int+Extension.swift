//
//  Int+Extension.swift
//  Moviedb
//
//  Created by Hellen on 18/09/21.
//

import Foundation

extension Int {
    
    var durationFormat: String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: TimeInterval(self * 60))
    }
}
