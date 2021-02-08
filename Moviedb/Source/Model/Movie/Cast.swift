//
//  Cast.swift
//  Moviedb
//
//  Created by Hellen Caroline on 02/02/21.
//

import Foundation

struct Cast: Codable {
    
    let castId: Int?
    let character: String?
    let creditId: String?
    let gender: Int?
    let id: Int?
    let name: String?
    let order: Int?
    let profilePath: String?
    
    private enum CodingKeys: String, CodingKey {
        case castId = "cast_id"
        case character = "character"
        case creditId = "credit_id"
        case gender = "gender"
        case id = "id"
        case name = "name"
        case order = "order"
        case profilePath = "profile_path"
    }
}
