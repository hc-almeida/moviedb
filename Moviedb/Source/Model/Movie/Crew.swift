//
//  Crew.swift
//  Moviedb
//
//  Created by Hellen on 18/09/21.
//

import Foundation

struct Crew: Decodable {
    
    let name: String
    
    let job: String
    
    let profilePath: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case job = "job"
        case profilePath = "profile_path"
    }
}
