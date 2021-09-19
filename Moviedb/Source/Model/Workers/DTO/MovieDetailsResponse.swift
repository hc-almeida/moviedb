//
//  MovieDetailsResponse.swift
//  Moviedb
//
//  Created by Hellen on 18/09/21.
//

import Foundation

struct MovieDetailsResponse: Decodable {
    
    let runtime: Int
    
    let genres: [Genre]
    
    let credits: Credits

    let recommendations: RecommendationResponse
}
