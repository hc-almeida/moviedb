//
//  MovieAPI.swift
//  Moviedb
//
//  Created by Hellen on 12/06/21.
//

import Foundation

public struct MovieAPI {
    
    // MARK: - Definitions
    
    public enum ImageSize: String {
        case original
        case w780
        case w500
        case w300
        case w200
    }
    
    // MARK: - Internal Properties
    
    public static let key: String = "4a2227bffae9ea53eebcaa7d05098303"
    public static let version: Int = 3
    public static let baseURL: String = "https://api.themoviedb.org/\(MovieAPI.version)"
    public static let imageURL: String = "https://image.tmdb.org/t/p"
    
    public static var language: String {
        return Locale.current.collatorIdentifier ?? "pt"
    }
    
    public static func build(image: String, size: ImageSize) -> String {
        return "\(MovieAPI.imageURL)/\(size.rawValue)/\(image)"
    }
    
    public static func build(section: Section, page: Int) -> String {
        return "\(MovieAPI.baseURL)/movie/\(section.rawValue)"
            + "?api_key=\(MovieAPI.key)&language=\(language)&page=\(page)"
    }
    
    public static func build(textSearch: String, page: Int) -> String {
        return "\(MovieAPI.baseURL)/search/movie"
        + "?api_key=\(MovieAPI.key)&language=\(language)&page=\(page)"
        + "&include_adult=false&query=\(textSearch)&watch_region=BR"
    }
    
    public static func build(detailsOf id: Int) -> String {
        return "\(MovieAPI.baseURL)/movie/\(id)?api_key=\(MovieAPI.key)"
            + "&language=\(language)&append_to_response=videos,credits,recommendations"
    }
}
