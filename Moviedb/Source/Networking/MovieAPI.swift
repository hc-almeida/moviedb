//
//  MovieAPI.swift
//  Moviedb
//
//  Created by Hellen on 12/06/21.
//

import Foundation

struct MovieAPI {
    
    // MARK: - Definitions
    
    enum ImageSize: String {
        case original
        case w780
        case w500
        case w300
        case w200
    }
    
    // MARK: - Internal Properties
    
    static let key: String = "4a2227bffae9ea53eebcaa7d05098303"
    static let version: Int = 3
    static let baseURL: String = "https://api.themoviedb.org/\(MovieAPI.version)"
    static let imageURL: String = "https://image.tmdb.org/t/p"
    
    static var language: String {
        return Locale.current.collatorIdentifier ?? "pt"
    }
    
    static func build(image: String, size: ImageSize) -> String {
        return "\(MovieAPI.imageURL)/\(size.rawValue)/\(image)"
    }
    
    static func build(section: Section, page: Int) -> String {
        return "\(MovieAPI.baseURL)/movie/\(section.rawValue)"
            + "?api_key=\(MovieAPI.key)&language=\(language)&page=\(page)"
    }
    
    static func build(textSearch: String, page: Int) -> String {
        return "\(MovieAPI.baseURL)/search/movie"
        + "?api_key=\(MovieAPI.key)&language=\(language)&page=\(page)"
        + "&include_adult=false&query=\(textSearch)&watch_region=BR"
    }
    
    static func build(detailsOf id: Int) -> String {
        return "\(MovieAPI.baseURL)/movie/\(id)?api_key=\(MovieAPI.key)"
            + "&language=\(language)&append_to_response=videos,credits,recommendations"
    }
}
