//
//  Movie.swift
//  Moviedb
//
//  Created by Hellen Caroline on 02/02/21.
//

import Foundation

struct MovieResult: Codable {
    let page: Int?
    let totalPages: Int?
    let totalResult: Int?
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalPages = "total_pages"
        case movies = "results"
        case totalResult = "total_results"
    }
}

struct Movie: Codable {

    let id: Int?
    let title: String?
    let voteAverage: Double
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: String?
    let overview: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case overview = "overview"
    }
}
