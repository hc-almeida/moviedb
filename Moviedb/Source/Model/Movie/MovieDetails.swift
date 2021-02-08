//
//  MovieDetails.swift
//  Moviedb
//
//  Created by Hellen Caroline on 02/02/21.
//

import Foundation

struct MovieDetail: Codable {
    let id: Int?
    let title: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let backdropPath: String?
    let runtime: Int?
    let budget:  Int?
    let releaseDate: String?
    let voteAverage: Double
    let genres: [Genre]?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case runtime = "runtime"
        case budget = "budget"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case genres = "genres"
    }
}
