//
//  Movie.swift
//  Moviedb
//
//  Created by Hellen Caroline on 02/02/21.
//

import Foundation

struct Movie: Decodable {

    let id: Int
    let title: String
    let voteAverage: Double
    let releaseDate: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case overview = "overview"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}
