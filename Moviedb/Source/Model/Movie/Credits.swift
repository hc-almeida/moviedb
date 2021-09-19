//
//  Credits.swift
//  Moviedb
//
//  Created by Hellen on 18/09/21.
//

import Foundation

struct Credits: Decodable {
    
    let cast: [Cast]
    
    let crew: [Crew]
}
