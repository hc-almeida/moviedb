//
//  MovieListResponse.swift
//  Moviedb
//
//  Created by Hellen on 12/06/21.
//

import Foundation

struct MovieListResponse: Decodable {
    
    let page: Int
    let totalPages: Int
    let totalResult: Int
    let results: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalPages = "total_pages"
        case totalResult = "total_results"
        case results = "results"
    }
}
